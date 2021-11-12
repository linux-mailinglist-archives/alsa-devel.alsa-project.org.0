Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C156A44E908
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Nov 2021 15:34:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CE05166E;
	Fri, 12 Nov 2021 15:33:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CE05166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636727661;
	bh=fEMx2xGhIdiro7MIogJux7meB8h6GcLTpGC08NvIs8I=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vgE6AWUIcJr+iD8HKEUnjulDWn8eBRWGKf3gXdHZoPuHbdYjuKiNB/GRrWSsb6+6k
	 nXStbOG+dQ+7ZbOuESql5rI8EKphMHyn4cOLkkdLiLtzmvbYcpbD8Ex1vLknYttz86
	 1KZKy/YtCP5GabQ/DFkm3TUbk9hRYhOlEhhnysWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C78A0F804B1;
	Fri, 12 Nov 2021 15:33:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21270F8049E; Fri, 12 Nov 2021 15:33:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF040F8014D
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 15:32:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF040F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iYKSx67s"
Received: by mail-lf1-x134.google.com with SMTP id l22so22811891lfg.7
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 06:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=XD7crzKVcHIZR9TTwOk4zytaHNeiCt1V42QZSpHXq14=;
 b=iYKSx67sSjNPH6AypBmd3pP+jG1s+7vID6tEZCijzsCpiNsNr6bCMhmb1l79BWML/B
 040ZtgneU8KNfYjMx8PGpvqtQOd2894HI2KxST9MGI0BIjSBecDgBJkTZ0x0nI3CFHsL
 1NbIX7KOdTKO5CFi7O0qee5UXw1w5hzjJIWWeH/+0WgPKlNpF5YYJVbmJxi7bkLKoOPb
 VTlnL/biZc7ROvACEuJrd3gtd5wEwm/tb83o6NvC8P3+oIavpbqRpDXtDfgbspC/hxqH
 g6zmTVi+BGA53ysDDxRTSalJZB99JbCea+vG8J1y1jIt15N+HreHVCMr5JZO/95X9TsH
 dajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=XD7crzKVcHIZR9TTwOk4zytaHNeiCt1V42QZSpHXq14=;
 b=EuiGwBq9LNyEZ3plT/MoWC+3uRWOpEes7ZSFNS4Fy8W8h/aa0I53cOVLKGFiPYjXKC
 KU1AvrH/JJpJPdXIbsg9btBoaUODxIRCC+lYqRsrSsLDcVjL/6/mrknwotLggHALmekY
 GNkfCK5p6Zv8N4e2ca8kE4AP2tNNL2WMz1PHwpw35ZoQlB+rD0jXZFzDqugekQNiX1kp
 y+qCCY+659FkrZA85S+EoebEf+/uiE60FWJwLwUbeqtZ0U6Thxprjp4bNMnopUHm5aX/
 ijL1KVPP7YHsW2v3wYrk7RyxHYODNSNCBn2t82wohc7cFXVrUR0jgdQNfi9qG9FztEXo
 7uQw==
X-Gm-Message-State: AOAM5338MqNOJgfEFFNWGaYqG+hIJD50FYg1AJIgPdRuFlFk5AeEBbeb
 orVeFhByXa4XLDcH6WhL3wY6gSeFTRKzO8vWWB8q2Sl3nuw=
X-Google-Smtp-Source: ABdhPJwlDOXo2+cTky7vzCRr5ASkUnKa1R3mrmqmPOGlWTLe0mjUTEwebjUagZmf/F58Uy44TqAbVVhLsEC198BTKug=
X-Received: by 2002:a05:6512:2304:: with SMTP id
 o4mr14381389lfu.543.1636727573201; 
 Fri, 12 Nov 2021 06:32:53 -0800 (PST)
MIME-Version: 1.0
From: sujith kumar reddy <sujithreddy6192@gmail.com>
Date: Fri, 12 Nov 2021 20:02:41 +0530
Message-ID: <CAAd2w=bYJ9ooP717PQxGug=vKG8Zw_B+0z-Qp0s9v-40O2W0ig@mail.gmail.com>
Subject: HDMI driver format channel mismatch bug
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>
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

Hi Alsa Team,

Sound is not coming in sony tv . which has below supported formats and
channels.

please find the attached  edid information and hw_params dump.

with intel platform, same monitor populating 2 channels as max in hw_params
in dump.
but with AMD card, its populating as 6 channels.


When we digged the code, we found that snd_hdmi_eld_update_pcm_info   API
setting hinfo->channel_max as 8 and as channels max retrieved from sad info
as 6.


for LPCM , why the channel max assignment logic is not safeguared with
audio format check as LPCM ?


snippet code:

/* update PCM info based on ELD */void
snd_hdmi_eld_update_pcm_info(struct parsed_hdmi_eld *e,
			      struct hda_pcm_stream *hinfo){
	u32 rates;
	u64 formats;
	unsigned int maxbps;
	unsigned int channels_max;
	int i;

	/* assume basic audio support (the basic audio flag is not in ELD;	 *
however, all audio capable sinks are required to support basic	 *
audio) */
	rates = SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
		SNDRV_PCM_RATE_48000;
	formats = SNDRV_PCM_FMTBIT_S16_LE;
	maxbps = 16;
	channels_max = 2;
	for (i = 0; i < e->sad_count; i++) {
		struct cea_sad *a = &e->sad[i];
		rates |= a->rates;
		if (a->channels > channels_max)
			channels_max = a->channels;
		if (a->format == AUDIO_CODING_TYPE_LPCM) {
			if (a->sample_bits & AC_SUPPCM_BITS_20) {
				formats |= SNDRV_PCM_FMTBIT_S32_LE;
				if (maxbps < 20)
					maxbps = 20;
			}
			if (a->sample_bits & AC_SUPPCM_BITS_24) {
				formats |= SNDRV_PCM_FMTBIT_S32_LE;
				if (maxbps < 24)
					maxbps = 24;
			}
		}
	}

	/* restrict the parameters by the values the codec provides */
	hinfo->rates &= rates;
	hinfo->formats &= formats;
	hinfo->maxbps = min(hinfo->maxbps, maxbps);
	hinfo->channels_max = min(hinfo->channels_max, channels_max);

>>>>>>>>>>the above statement channels_max is the maximum of channels supported of different formats.

For example: the below attached edid is of sony tv. which supports two
formats(LPCM and AC3)

            LPCM --->supports 2 channels

            AC3 ----->Supports 6 channels you can see in the attached edid info.

       As AMD supports LPCM ...>when we keep logs here we got
channels_max =6 .in which sound is not observed on tv .when we
hardcode to 2 channels

       the sound is heard from monitor. As you see the above code
..for loop is not distinguishing channels_max for different formats.

}


Thanks in Advance



https://pastebin.com/t41DqErH   ------edid information
https://pastebin.com/4m56h10R  -----dump hw-params

Thanks
Sujith
