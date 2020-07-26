Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B678422E1F0
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 20:22:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3188C168C;
	Sun, 26 Jul 2020 20:21:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3188C168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595787732;
	bh=mCt9A4wYUs1QSh0FyNg85NPIjkkkpKc8A0LhfeSWlmU=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cKpUhvPDJ38M5WNqI9r33p1hOXorhPCB1ThivIZxxVpMpmk59F9vBjjQJBnWDzcpz
	 Cx7BBjciTKzJTLuIbEzgCpecOZrdPAWbpBeR49QzfV9BPG9SqXf0UYiPheprVpUzgM
	 hx0pWDl3XDjRuWy+c0qr7PbHCgZ/kNSCyQt8WJY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52D00F801F7;
	Sun, 26 Jul 2020 20:20:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF923F8020B; Sun, 26 Jul 2020 20:20:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4478F8013C
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 20:20:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4478F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="dUX3Fzwi"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="g9gSDyNT"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 8C251A1F65A75;
 Sun, 26 Jul 2020 20:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1595787621; bh=mCt9A4wYUs1QSh0FyNg85NPIjkkkpKc8A0LhfeSWlmU=;
 h=To:From:Subject:Date:From;
 b=dUX3Fzwilla0CqPMYsbar8EPs8TWe7YHJm21L4Nl2t31Zf/YpD1Udd9mqpO+Dddc4
 OHdKsUg/2L3nmMZNSKH0te3nR1wADXWyZ4fmRtTqzWecqI6GE1d2mxMcmplWd7KJyV
 oUwZ46B+eMYbSxqh8EUciJh2c6Koti+Q6+Xgu+P4=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id erY9V1iM6ucl; Sun, 26 Jul 2020 20:20:15 +0200 (CEST)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 49FB4A1F4B1B4;
 Sun, 26 Jul 2020 20:20:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1595787615; bh=mCt9A4wYUs1QSh0FyNg85NPIjkkkpKc8A0LhfeSWlmU=;
 h=To:From:Subject:Date:From;
 b=g9gSDyNTQnwP/De2JSQ5+hjLtsmDit0VniE0aAeyfxvQ0IIhBz4UaKc4M8QG2KdWi
 OhC6y5VwVkmAS/i3vmSRVpjnoEc6jMFX0RIjb6wgiJ1CiK20p0ikkMjHp6H/dERju5
 2WR4+battXO/FwbPwpa3WJ9OISXdBOx4uMfYEmTE=
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: pcm_meter.c issue at s16_update
Message-ID: <f56d6a67-014a-e562-c253-830c0ec03717@ivitera.com>
Date: Sun, 26 Jul 2020 20:20:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi,

I am debugging the following problem with the PCM METER API:

An application with meter/scope configured in .asoundrc hits a high CPU
load sometimes when a new playback stream is opened. E.g. in MPD when
opening a new radio stream. The 100% CPU core load takes tens of seconds.

Debugging the issue revealed this:


TL;DR: at decrease of [status.appl_ptr - status.delay] between
consequent runs the size of buffer to convert by the built-in s16 scope
is set from usual 100s to huge value of pcm->boundary (1.5G), causing a
very long processing at 100% core load.

Details:

Every scope setup uses a default s16 scope defined in alsa-lib, which
converts samples to s16 so that the user-provided scopes can access data
via snd_pcm_scope_s16_get_channel_buffer buffers with converted samples.

The s16 scope converts samples in a loop, in frames chunks, decrementing
size variable by frames until zero. The value of size is hundreds
samples max at each s16_update call, calculated in
https://github.com/alsa-project/alsa-lib/blob/master/src/pcm/pcm_meter.c#L1100
. A debug added after that line shows this:

@@ -1098,14 +1103,18 @@ static void s16_update(snd_pcm_scope_t *scope)
        snd_pcm_sframes_t size;
        snd_pcm_uframes_t offset;
        size = meter->now - s16->old;
+       fprintf(stderr, "s16_update 1: meter->now %ld, s16->old %ld,
size %ld\n", meter->now, s16->old, size);
        if (size < 0)
                size += spcm->boundary;
        offset = s16->old % meter->buf_size;




s16_update 1: meter->now 2154673, s16->old 2153771, size 902
s16_update 1: meter->now 2155579, s16->old 2154673, size 906
s16_update 1: meter->now 2156487, s16->old 2155579, size 908
s16_update 1: meter->now 2157391, s16->old 2156487, size 904
s16_update 1: meter->now 2158298, s16->old 2157391, size 907
s16_update 1: meter->now 2159203, s16->old 2158298, size 905
s16_update 1: meter->now 2160091, s16->old 2159203, size 888
s16_update 1: meter->now 2160976, s16->old 2160091, size 885
s16_update 1: meter->now 2161924, s16->old 2160976, size 948
s16_update 1: meter->now 2162829, s16->old 2161924, size 905
s16_update 1: meter->now 2163733, s16->old 2162829, size 904
s16_update 1: meter->now 2164594, s16->old 2163733, size 861
s16_update 1: meter->now 2165542, s16->old 2164594, size 948
s16_update 1: meter->now 2166448, s16->old 2165542, size 906
s16_update 1: meter->now 2167352, s16->old 2166448, size 904
s16_update 1: meter->now 2168259, s16->old 2167352, size 907
s16_update 1: meter->now 2169165, s16->old 2168259, size 906
s16_update 1: meter->now 2170050, s16->old 2169165, size 885
s16_update 1: meter->now 2170936, s16->old 2170050, size 886
s16_update 1: meter->now 2171877, s16->old 2170936, size 941
s16_update 1: meter->now 2172783, s16->old 2171877, size 906
s16_update 1: meter->now 2173690, s16->old 2172783, size 907
s16_update 1: meter->now 2174596, s16->old 2173690, size 906
s16_update 1: meter->now 2175502, s16->old 2174596, size 906
s16_update 1: meter->now 2176407, s16->old 2175502, size 905
s16_update 1: meter->now 2177311, s16->old 2176407, size 904
s16_update 1: meter->now 2178215, s16->old 2177311, size 904


However, sometimes meter->now < s16->old, causing size < 0, for which
this line applies
https://github.com/alsa-project/alsa-lib/blob/master/src/pcm/pcm_meter.c#L1102

size += spcm->boundary

and size becomes a huge number, because hw:0 pcm -> boundary is
1445068800. The loop at
https://github.com/alsa-project/alsa-lib/blob/master/src/pcm/pcm_meter.c#L1104
takes tens of seconds, untill the huge buffer is converted to s16.

Usually the negative difference is quite small:

s16_update 1: meter->now 988, s16->old 21139, size -20151
s16_update 1: meter->now 870, s16->old 18865, size -17995
s16_update 1: meter->now 1065, s16->old 20786, size -19721
s16_update 1: meter->now 701, s16->old 24839, size -24138
s16_update 1: meter->now 782, s16->old 869, size -87
s16_update 1: meter->now 763, s16->old 841, size -78
s16_update 1: meter->now 963, s16->old 22525, size -21562
s16_update 1: meter->now 665, s16->old 832, size -167
s16_update 1: meter->now 745, s16->old 865, size -120
s16_update 1: meter->now 859, s16->old 1002, size -143
s16_update 1: meter->now 935, s16->old 117452, size -116517


Yet in all these cases the size variable is incremented by 1445068800,
which clearly does not make sense.

Now the question is how it happens that meter->now < s16->old, when
meter->now is calculated by now = status.appl_ptr - status.delay
https://github.com/alsa-project/alsa-lib/blob/master/src/pcm/pcm_meter.c#L219
and s16->old is set to meter->now at the end of each s16_update call
https://github.com/alsa-project/alsa-lib/blob/master/src/pcm/pcm_meter.c#L1142
.

The debug around the event looks like this, suddenly meter->now drops down:

s16_update 1: meter->now 2567498, s16->old 2566593, size 905
s16_update 1: meter->now 2568401, s16->old 2567498, size 903
s16_update 1: meter->now 20786, s16->old 20786, size 0
s16_update 1: meter->now 1065, s16->old 20786, size -19721
s16_update 1: meter->now 24839, s16->old 24838, size 1
s16_update 1: meter->now 701, s16->old 24839, size -24138
s16_update 1: meter->now 1253162, s16->old 701, size 1252461
s16_update 1: meter->now 1255148, s16->old 1253162, size 1986

..........

s16_update 1: meter->now 11136, s16->old 10261, size 875
s16_update 1: meter->now 22525, s16->old 22524, size 1
s16_update 1: meter->now 963, s16->old 22525, size -21562
s16_update 1: meter->now 1270914, s16->old 963, size 1269951
s16_update 1: meter->now 1272917, s16->old 1270914, size 2003


Could it perhaps be an XRUN, causing the difference (status.appl_ptr -
status.delay)  to actually decrease compared to the previous run? I
really do not know how/when such decrease can happen. But if it is a
standard situation, than IMO the size of to-be converted buffer by the
s16 scope  should not be set to the huge pcm->boundary.

Thanks a lot for help.

Best regards,

Pavel.
