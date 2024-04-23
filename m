Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E54C98ADBA4
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 03:44:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7A71162E;
	Tue, 23 Apr 2024 03:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7A71162E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713836655;
	bh=ufSwTEYdLjNh53VNo5n/InjNNNfWiz9aDd8WKQpIqGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s4zLRX97DTwABpdXZoLWbcJ/uJviJbwLiYrFdOeshPsr1adstijG50mFBdQW2zheb
	 iCDigLbP5mFDEvf2xJymYvyQZ2uYRG7Ajez2BtGqo8LlkOP4VEAo5MmefnO3s2jNGp
	 hbYz9zv9yXh/iIWQisvdudRiXzDKF1GXDs2GHwqQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2201F80548; Tue, 23 Apr 2024 03:43:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B4EFF80548;
	Tue, 23 Apr 2024 03:43:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A000BF80423; Tue, 23 Apr 2024 03:43:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E76CF8003A
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 03:43:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E76CF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=c7XdDmA2
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6eff2be3b33so4840851b3a.2
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Apr 2024 18:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713836607; x=1714441407;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FVv9MGjbF3k+4QlXe6bHKBL0yNq+kWVhwIIKL4GtREU=;
        b=c7XdDmA2GCxIT6JUU5JCVw4ZjhrzZ5Uc2Mfpzzc4ht79vsIo643i9Qox+lUi8NxOJ3
         +20WRpSVZlloumqDfPdoOG8w5Do+t28ErScYN24Xin6hTQJ2Y6qMB4e9sEK01/DXQ9uE
         wtkQLeJDcS2l5Uhe25w7jHU2nn7huQpkpWxGJ5yiIsIxVRSNNH9ukBjttIrUXJeFhKSN
         wpMLfwK2EbkRWS/pK1PagIP6026JCM4M4DEmJ7jIsOA+lTY1T9E/Clcs/HUO+6Zb0qzH
         jsQydq85tMyZDAF8s+eoUPQAoXNCe1ZqR0f7fFWs0fh3eJ8/R0fF85pYOZWs7C20x0WM
         Ir8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713836607; x=1714441407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVv9MGjbF3k+4QlXe6bHKBL0yNq+kWVhwIIKL4GtREU=;
        b=n8c7m0BPqzixRqjrY5C23xhbI06lRlcCDHKgSSYtG+aJqnTri2QaqnbWofVqnyRB1T
         pxKm01WOPKFhD1yT0L5ZhSY2VmuscLAXFiUEDMznc4whnMtJpNRK2ZKsH23k+cZvaCpP
         H81mkeol38cSKRdAHjeOkB89Jxr7L3WQy79XhA8Ce5Xa6fc38g1VnmOqXtWStVdZIJWT
         zO/HjUTbt5GYe9rr9T9MmDuTXQr22L12qT7QBuhT3pk8shZK+nsnqhY8SfpUiBOX4f2Y
         6BbFWoAbuRG0/VoXWHeG4vLNDZ/HhH4W35U9xC6m/kbNZSnUaa+n1mlIpBN0t3+YlxX+
         dK2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaeQOaE6YfttLiftS6zQjctqmVVTTIzmud+aE9RVp1+H17mde0S5mYPmrHuzaNAi5IEKOxlh/kbq3csnkAdsOQb9JODLzNcQjqDjI=
X-Gm-Message-State: AOJu0YxtiwPQIaHBaM55nSzwwyB5dCcKk7MDvh38oJQ0lLZ/KMwZUCvl
	9+yMNsNzGrfSozbRk/jJe0EelXfHarOK/5mAsUbmDlj9f6VwtyNaU9sQBg==
X-Google-Smtp-Source: 
 AGHT+IHNvVbE9cA2XCQLQKjnl3qgdgnVkMyNXB6fh5i88nUQTMFnT4C4mWly1ZAKH13pWuCwaxCS8g==
X-Received: by 2002:a05:6a00:1950:b0:6ec:fe38:d94 with SMTP id
 s16-20020a056a00195000b006ecfe380d94mr14924140pfk.33.1713836607279;
        Mon, 22 Apr 2024 18:43:27 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id
 gj14-20020a056a00840e00b006ed93e7ef22sm8471175pfb.39.2024.04.22.18.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 18:43:26 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 6C2B718688A48; Tue, 23 Apr 2024 08:43:23 +0700 (WIB)
Date: Tue, 23 Apr 2024 08:43:23 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
	tiwai@suse.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v19 41/41] ASoC: doc: Add documentation for SOC USB
Message-ID: <ZicSOzE8KyaYGi0v@archie.me>
References: <20240422224906.15868-1-quic_wcheng@quicinc.com>
 <20240422224906.15868-42-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240422224906.15868-42-quic_wcheng@quicinc.com>
Message-ID-Hash: 5XVRPFK44AD7HIEVUYBWMN5774WX2FKR
X-Message-ID-Hash: 5XVRPFK44AD7HIEVUYBWMN5774WX2FKR
X-MailFrom: bagasdotme@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XVRPFK44AD7HIEVUYBWMN5774WX2FKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 22, 2024 at 03:49:06PM -0700, Wesley Cheng wrote:
> +.. code-block:: rst
> +
> +int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
> +					struct snd_soc_jack *jack)
> +..

You forget to indent snd_soc_usb_setup_offload_jack() prototype:

---- >8 ----
diff --git a/Documentation/sound/soc/usb.rst b/Documentation/sound/soc/usb.rst
index 3f7c3ef6a0c03c..0b6da0be9f317f 100644
--- a/Documentation/sound/soc/usb.rst
+++ b/Documentation/sound/soc/usb.rst
@@ -218,8 +218,8 @@ state.
 
 .. code-block:: rst
 
-int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
-					struct snd_soc_jack *jack)
+        int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
+        					struct snd_soc_jack *jack)
 ..
 
   - ``component``: ASoC component to add the jack

> +USB Offload Playback Route Select Kcontrol
> +-----------------------------------

USB offload playback heading underlines are not long enough to cover heading
titles, so I have to extend them:

---- >8 ----
diff --git a/Documentation/sound/soc/usb.rst b/Documentation/sound/soc/usb.rst
index 0b6da0be9f317f..5e0e9fad131b24 100644
--- a/Documentation/sound/soc/usb.rst
+++ b/Documentation/sound/soc/usb.rst
@@ -482,7 +482,7 @@ into the physical USB port and enumerated.  The kcontrols are defined as:
     kcontrol exposed by the platform card.
 
 USB Offload Playback Route Select Kcontrol
------------------------------------
+------------------------------------------
 In order to allow for vendor specific implementations on audio offloading device
 selection, the SOC USB layer exposes the following:
 
@@ -545,7 +545,7 @@ along to the external DSP.
 
 
 USB Offload Playback Route Status
--------------------
+---------------------------------
 SOC USB exposes APIs for keeping track of the offloading state, and expects this
 to be maintained by the BE DAI link that created/added the SOC USB device.
 
@@ -573,7 +573,7 @@ When executing the kcontrol get callback, it will loop across the active_list ar
 and report to the application for active USB sound card and USB PCM device indexes.
 
 USB Offload Playback Capable Card
--------------------------------
+---------------------------------
 USB sound also creates a kcontrol for applications to help determine which platform
 sound card USB offloading is linked to.  This will allow applications to further
 query the platform sound card for specific information about the current USB offload

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
