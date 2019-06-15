Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 442AF47223
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2019 22:44:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D131834;
	Sat, 15 Jun 2019 22:43:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D131834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560631452;
	bh=xPX2ie8JmdwBn7wJkSnJJWMtZNLZAkAADVdKYWQ3Zf4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aV4kEFJcU6I5p3GA9BYGDaPWJYWRqc+H7TfCmXUVFZ8nS0XitrD4jo+UH7RNCTiD2
	 vQQSABPjlYL+WF+3yNC31Ylcc4MFSaaAnN6pA6ewuoJUblag9x1FXtjQ7KSOO5c/zD
	 VL4QVAHaCvzAJsxdGRt2NfmHBm3cqOaUP6/PYSHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C84AF89711;
	Sat, 15 Jun 2019 22:42:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BE81F89703; Sat, 15 Jun 2019 22:41:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=HTML_MESSAGE,SPF_FAIL,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from p3plwbeout03-04.prod.phx3.secureserver.net
 (p3plsmtp03-04-2.prod.phx3.secureserver.net [72.167.218.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 558CFF80764
 for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2019 22:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 558CFF80764
Received: from p3plgemwbe03-06.prod.phx3.secureserver.net ([72.167.218.134])
 by :WBEOUT: with SMTP
 id cFTzhEHH75iD0cFTzh0ACi; Sat, 15 Jun 2019 13:41:03 -0700
X-SID: cFTzhEHH75iD0
Received: (qmail 52481 invoked by uid 99); 15 Jun 2019 20:41:03 -0000
MIME-Version: 1.0
To: alsa-devel@alsa-project.org
From: "scott andrew franco" <samiam@moorecad.com>
Date: Sat, 15 Jun 2019 13:41:03 -0700
Message-Id: <20190615134103.6c61c97e98fe7bb02193b2d6dca4a85a.50a60f16a4.mailapi@email03.godaddy.com>
X-Originating-IP: 73.93.93.31
User-Agent: MailAPI 
X-Sender: samiam@moorecad.com
X-CMAE-Envelope: MS4wfMo0dCm8eZRo8Tu0jWR/ps8NI5FZCthzjbjAqflCV1Opd8wPCcm2v2lmziA2aHwsxr8cYmZ/og5VIlLZ2D4+7wZt0MeWvwWdpVlPA3nOxbEceO9QVdsH
 MlQL8QpvKxZjDUVZlVHUOorNib0aquKsi8aCptLWhc42FyuBgCilzLKEvPQ3bLcHm3hEg5S/+LToJyCi165UgRD+5730buVe3K+vYsQrbubNb37qaaEz9iEH
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Building the alsa library
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,
 
I have been trying to solve a difficult issue using the ALSA library. To solve it, I need to be able to
debug into the ALSA library.
 
I tried to build it from the sources, from the alsa-lib-1.1.9 library source to be specific.
 
Problems:
 
Using the build procedure in the INSTALL file, it appeared to build but I could not find a libasound.so file
anywhere.
 
I also tried the recommended procedure for static linking, also from the INSTALL file. That gives a 
./src/.libs/libasound.a file (indeed, this gets generated on a dynamic link as well, which I don't understand).
 However, linking with that produces (after adding back a few missing libs):
 samiam@samiam-linux-pc:~/scratch$ ./hello
This is a test program
ALSA lib conf.c:3558:(snd_config_hooks_call) Cannot open shared library libasound_module_conf_pulse.so (/usr/lib/alsa-lib/libasound_module_conf_pulse.so: libasound_module_conf_pulse.so: cannot open shared object file: No such file or directory)
ALSA lib pcm.c:2564:(snd_pcm_open_noupdate) Unknown PCM default
Program complete
 IE., it is linking pulse audio? Or do I need another .a file from the library collection?
 Notes: here is the .a files from the alsa-lib build:
 samiam@samiam-linux-pc:~/projects/alsa/alsa-lib-1.1.9$ find . -name *.a
./src/pcm/.libs/libpcm.a
./src/seq/.libs/libseq.a
./src/rawmidi/.libs/librawmidi.a
./src/ucm/.libs/libucm.a
./src/timer/.libs/libtimer.a
./src/topology/.libs/libtopology.a
./src/hwdep/.libs/libhwdep.a
./src/mixer/.libs/libmixer.a
./src/control/.libs/libcontrol.a
./src/.libs/libasound.a
 Here is the test file I am building (hello.c):
 #include <stdio.h>
#include <alsa/asoundlib.h>
 int main(void)
 {
 snd_pcm_t *pcm_handle;
 printf("This is a test program\n");
 snd_pcm_open(&pcm_handle, "default", SND_PCM_STREAM_PLAYBACK, 0);
 printf("Program complete\n");
 
}
 Here is the line used to compile it:
 gcc -static -o hello hello.c libasound.a -pthread -lm -ldl
 Thanks in advance.
 Scott Franco
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
