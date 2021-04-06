Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED599355061
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 11:54:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7036D166B;
	Tue,  6 Apr 2021 11:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7036D166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617702886;
	bh=C+XaHH86s2a/XYUcPX3FshyWmNs8DvLOmyrNdBINv3M=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ciF9UjD5yi0KD9t7YpKA4q5A8hSmPwZtHZDJsNHObyMfoxe8vNs8M3zdpXZMKsAXt
	 Sa1q8kNDkhg8FovxlW1//oEUhGnzNb677zBwA+ag3Wlc/J3LOybb2Y9rMndEOucQ5m
	 3V/MuSzDuxBAUZRDflED7osjKkBVNHJ7LaQVV7xY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFC26F80246;
	Tue,  6 Apr 2021 11:53:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C0D0F8020B; Tue,  6 Apr 2021 11:53:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6C09CF800E3
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 11:53:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C09CF800E3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1617702783779664993-webhooks-bot@alsa-project.org>
References: <1617702783779664993-webhooks-bot@alsa-project.org>
Subject: snd_pcm_htimestamp returns time past since last boot not clock time
Message-Id: <20210406095317.3C0D0F8020B@alsa1.perex.cz>
Date: Tue,  6 Apr 2021 11:53:17 +0200 (CEST)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #131 was opened from RonaldAJ:

While on a PC snd_pcm_htimestamp returns the clock time since the epoch, under Raspbian on an RPI it returns the time since the last boot. (A similar issue was described here: https://stackoverflow.com/questions/45841230/alsa-retrieving-audio-buffer-timestamps).

The problem shows if we run a slightly modified version of recordtest.py using the latest pyalsaaudio versions.

```
#!/usr/bin/env python3
# -*- mode: python; indent-tabs-mode: t; c-basic-offset: 4; tab-width: 4 -*-

## recordtest.py
##
## This is an example of a simple sound capture script.
##
## The script opens an ALSA pcm device for sound capture, sets
## various attributes of the capture, and reads in a loop,
## writing the data to standard out.
##
## To test it out do the following:
## python recordtest.py out.raw # talk to the microphone
## aplay -r 8000 -f S16_LE -c 1 out.raw

#!/usr/bin/env python

from __future__ import print_function

import sys
import time
import getopt
import alsaaudio

def usage():
	print('usage: recordtest.py [-d <device>] <file>', file=sys.stderr)
	sys.exit(2)

if __name__ == '__main__':

	device = 'default'

	opts, args = getopt.getopt(sys.argv[1:], 'd:')
	for o, a in opts:
		if o == '-d':
			device = a

	if not args:
		usage()

	f = open(args[0], 'wb')

	# Open the device in nonblocking capture mode in mono, with a sampling rate of 44100 Hz 
	# and 16 bit little endian samples
	# The period size controls the internal number of frames per period.
	# The significance of this parameter is documented in the ALSA api.
	# For our purposes, it is suficcient to know that reads from the device
	# will return this many frames. Each frame being 2 bytes long.
	# This means that the reads below will return either 320 bytes of data
	# or 0 bytes of data. The latter is possible because we are in nonblocking
	# mode.
	inp = alsaaudio.PCM(alsaaudio.PCM_CAPTURE, alsaaudio.PCM_NONBLOCK, 
		channels=1, rate=44100, format=alsaaudio.PCM_FORMAT_S16_LE, 
		periodsize=160, device=device)

	print(inp.info())
	# help(inp.htimestamp)

	loops = 100000
	while loops > 0:
		loops -= 1
		# Read data from device
		l, data = inp.read()
		if l:
			print(l, inp.htimestamp(), time.time())
			f.write(data)
			time.sleep(.001)
```

When executed on an RPi it yields:
```
{'name': 'plugsnoop:1,0', 'state': 'PREPARED', 'access_type': 'RW_INTERLEAVED', ' (call value) type': 1, ' (call value) type_name': 'CAPTURE', ' (call value) mode': 1, ' (call value) mode_name': 'PCM_NONBLOCK', 'format': 2, 'format_name': 'S16_LE', 'format_description': 'Signed 16 bit Little Endian', 'subformat_name': 'STD', 'subformat_description': 'Standard', 'channels': 1, 'rate': 44100, 'period_time': 21333, 'period_size': 940, 'buffer_time': 0, 'buffer_size': 4704, 'get_periods': 0, 'rate_numden': (44100, 1), 'significant_bits': 16, 'is_batch': True, 'is_block_transfer': True, 'is_double': False, 'is_half_duplex': False, 'is_joint_duplex': False, 'can_overrange': False, 'can_mmap_sample_resolution': False, 'can_pause': False, 'can_resume': False, 'can_sync_start': False}
940 (5596, 851796145, 0) 1617702646.0637105
940 (5596, 872796030, 0) 1617702646.084714
940 (5596, 893795916, 0) 1617702646.105702
940 (5596, 915796158, 0) 1617702646.1277127
940 (5596, 936795314, 0) 1617702646.1486921
940 (5596, 957795199, 0) 1617702646.1697078
940 (5596, 979795858, 0) 1617702646.191694
940 (5597, 795171, 0) 1617702646.212712
...
```
I read that for the timestamp function to work there should be hardware support. But here we have it half working. 

This behavior is shown if I use the following in my .asoundrc

```
pcm.plugsnoop {
    type plug

    @args [ CARD DEV ]

    @args.CARD {
        type string
    }

    @args.DEV {
        type integer
    }

    slave { 
        pcm {
                @func concat
                strings [
                    "dsnoop:"
                    $CARD
                    ","
                    $DEV
                ]
            }
    }
}
```
and call it with:
`python recordtest.py -d plugsnoop:1,0 test.raw`

Using plughw all timestamps become zero.

The attached microphone is an USB microphone: GoMic by SAMSON.

Is there a  fix or workaround for this behavior which gives me clocktime instead of seconds since last boot?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/131
Repository URL: https://github.com/alsa-project/alsa-lib
