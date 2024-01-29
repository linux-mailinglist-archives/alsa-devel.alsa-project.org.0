Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6D0840D0A
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 18:07:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 993EF846;
	Mon, 29 Jan 2024 18:07:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 993EF846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706548056;
	bh=65+Pd1Qy5NwHHzFEmwr0qkDQekfSg+Vi6ZxPVom3jqA=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=B1DrYN7lAImOyFBdk23gLb8E22PXOsAQF1W0ZtqXpAMquK12APti28I2yWrNeg5q2
	 eon1BvtZLjlb/wOfwt+6yQ6qelFrF7s/VXbvvmJdf+9LlHYouKSiI0+hj01Lcql1Ou
	 htlp8OcZ5+KCjkyg7garwFJx0qfWzntsrmp89UiM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68762F805AC; Mon, 29 Jan 2024 18:07:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DEABF80589;
	Mon, 29 Jan 2024 18:07:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F401F80563; Mon, 29 Jan 2024 18:06:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E436F8055B
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 18:06:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E436F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=LMtMSNWb;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=LMtMSNWb
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id A2726B963
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 18:06:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1706547998; bh=65+Pd1Qy5NwHHzFEmwr0qkDQekfSg+Vi6ZxPVom3jqA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=LMtMSNWbVJT/sWtuWJJYQm2EyfRH6MYv7Zhm4hDYGJUaIUqgk+fVW3DEETbQCWSN0
	 z16zcFMnVlUELum8Fnts+LJ4N8HFWBBoXuNp1PexsCAdr1G9870DG/zdsqJgD77zSp
	 dIPQZM0MUHnYt6kJ4OE6TGtrRuXBNeMuvnenPuHc=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mg2ygAZnEHcB for <alsa-devel@alsa-project.org>;
	Mon, 29 Jan 2024 18:06:38 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 2BA7EB962
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 18:06:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1706547998; bh=65+Pd1Qy5NwHHzFEmwr0qkDQekfSg+Vi6ZxPVom3jqA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=LMtMSNWbVJT/sWtuWJJYQm2EyfRH6MYv7Zhm4hDYGJUaIUqgk+fVW3DEETbQCWSN0
	 z16zcFMnVlUELum8Fnts+LJ4N8HFWBBoXuNp1PexsCAdr1G9870DG/zdsqJgD77zSp
	 dIPQZM0MUHnYt6kJ4OE6TGtrRuXBNeMuvnenPuHc=
Message-ID: <14018498-75e9-28c4-cfe3-a958ede64d0e@ivitera.com>
Date: Mon, 29 Jan 2024 18:06:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: ALSA-LIB: Support for format IEC958_SUBFRAME_LE in the plug
 plugin?
Content-Language: en-US
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <81b0be0a-5ab7-db91-21cb-0c59a55291e9@ivitera.com>
In-Reply-To: <81b0be0a-5ab7-db91-21cb-0c59a55291e9@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QTZS4H3E45NJEJRTQWIMEZVJYTUEXA2G
X-Message-ID-Hash: QTZS4H3E45NJEJRTQWIMEZVJYTUEXA2G
X-MailFrom: pavel.hofman@ivitera.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QTZS4H3E45NJEJRTQWIMEZVJYTUEXA2G/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne 26. 01. 24 v 9:00 Pavel Hofman napsal(a):

> RPi has recently moved to the VC4 driver which accepts only 
> IEC958_SUBFRAME_LE format 
> https://github.com/torvalds/linux/blob/ecb1b8288dc7ccbdcb3b9df005fa1c0e0c0388a7/drivers/gpu/drm/vc4/vc4_hdmi.c#L2643 . Since then people started to have issues with their previous configs which use only the plug plugin (plughw:X).
> 
> Wrapping the device with the hdmi plugin solves the problem, as it 
> should. But e.g. mainline java support for alsa offers only hw cards 
> wrapped with the plug plugin (hardcoded, not possible to specify the 
> device name directly). Stock Java apps then do not work with RPi HDMI.
> 
> I was wondering if it made sense to add support for the IEC958 formats 
> (using the iec958 plugin methods) to the plug plugin.
> 
> It may be complicated with the hdmi_mode hint though, I do not know if 
> there is any API to recognize HDMI vs. SPDIF. Maybe a different format 
> specifically for HDMI could have been perhaps useful but it may be too 
> late for that.
> 
> Thank you very much for consideration.
> 


Perhaps something trivial like this could do (header file changes not 
included):

===================================================================
diff --git a/src/pcm/pcm_plug.c b/src/pcm/pcm_plug.c
--- a/src/pcm/pcm_plug.c	(revision ffed4f342678c31bf0b9edfe184be5f3de41603a)
+++ b/src/pcm/pcm_plug.c	(date 1706546414549)
@@ -490,6 +490,14 @@
  }
  #endif

+int snd_pcm_plug_generic_iec958_open(snd_pcm_t **pcmp, const char 
*name, snd_pcm_format_t sformat, snd_pcm_t *slave, int close_slave) {
+	unsigned char preamble_vals[3] = {
+			0x08, 0x02, 0x04 /* Z, X, Y */
+		};
+	int hdmi_mode; // ????
+	return snd_pcm_iec958_open(pcmp, name, sformat, slave, close_slave, 
NULL, preamble_vals, hdmi_mode);
+}
+
  static int snd_pcm_plug_change_format(snd_pcm_t *pcm, snd_pcm_t **new, 
snd_pcm_plug_params_t *clt, snd_pcm_plug_params_t *slv)
  {
  	snd_pcm_plug_t *plug = pcm->private_data;
@@ -567,6 +575,10 @@
  			f = snd_pcm_adpcm_open;
  			break;
  #endif
+		case SND_PCM_FORMAT_IEC958_SUBFRAME_LE:
+		case SND_PCM_FORMAT_IEC958_SUBFRAME_BE:
+			f = pcm_snd_general_iec958_open;
+			break;
  		default:
  			return -EINVAL;
  		}

===================================================================


IMO preamble_vals could be left at the same default as defined in 
pcm_iec958.c:_snd_pcm_iec958_open().

But the correct hdmi_mode parameter is necessary. Alsa configs specify 
it explicitly (like vc4-hdmi.conf). But the plug plugin has no such 
information. Adding a parameter like that to the plug plugin would 
cancel the effect of this change (to support hardcoded plughw devices 
e.g. in java, with no support for custom PCM devices).

Maybe an environment variable could be defined for the whole application 
which could be used for the hdmi_mode, an ugly hack though...

Thanks a lot for any hints and suggestions.

With regards,

Pavel.
