Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D71F797595
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 17:52:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7DB886F;
	Thu,  7 Sep 2023 17:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7DB886F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694101953;
	bh=yygdrR9tXi+0eL4XEux60q+4Uf5gpP4X6x/GdxMk2nQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=otir9OJn06YDK7dmIX74QDcqxPyoBcgDLG5J6vmeuOJNjBjlJZ5nAJ0Jy3ilKCri/
	 WqKtDPlVSUOWSRpT/T+X9Zwa7C60PSy3vCUJaxYkZg2066h71QLVtADBryOcHCxA6s
	 deWbg3Aw2il2YU2rR2Tx5MXEI2RZizA5nSr16St4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28BD6F80494; Thu,  7 Sep 2023 17:51:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4188F8047D;
	Thu,  7 Sep 2023 17:51:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1C20F80494; Thu,  7 Sep 2023 17:51:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9541EF80431
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 17:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9541EF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MG/RWiix;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PgTRAY/j
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C27FE21862;
	Thu,  7 Sep 2023 15:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694101893;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tk3J/weePsTr2+puEZaryztfMldIRsL7MjS11xHNPq4=;
	b=MG/RWiixzRUD5n21QY2yXLKv/zxycwe2jvwvqsZhnjyl0H7FMWmzreTziH5v3xUpVO2ST2
	yu4FWXTNDRNIKjs3oZrJrIlUYo9ByzoFJFbu7uGHWT000wzW87sPlE0S3X6h6mrCb2Poln
	jyaxTpMKrnwUimNWsKjEy53luKAW7rc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694101893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tk3J/weePsTr2+puEZaryztfMldIRsL7MjS11xHNPq4=;
	b=PgTRAY/jSIOr1hyGZbPTqd+ID749qUOYH1g8gzONDoREaJFpp8MDUTuBDrtTkNFrVzvWF8
	MQwXRemp0OfM7WCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4946E138FA;
	Thu,  7 Sep 2023 15:51:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gkbnEIXx+WQ+CwAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 07 Sep 2023 15:51:33 +0000
Date: Thu, 07 Sep 2023 17:51:32 +0200
Message-ID: <8734zqasmz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>,
	<perex@perex.cz>,
	<lgirdwood@gmail.com>,
	<andersson@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>,
	<gregkh@linuxfoundation.org>,
	<Thinh.Nguyen@synopsys.com>,
	<broonie@kernel.org>,
	<bgoswami@quicinc.com>,
	<tiwai@suse.com>,
	<robh+dt@kernel.org>,
	<agross@kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<quic_jackp@quicinc.com>,
	<quic_plai@quicinc.com>
Subject: Re: [PATCH v5 18/32] sound: usb: Introduce QC USB SND offloading
 support
In-Reply-To: <20230829210657.9904-19-quic_wcheng@quicinc.com>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
	<20230829210657.9904-19-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: U4KNQGEKXSQVLCZ63VVZC47F5DIPY4RE
X-Message-ID-Hash: U4KNQGEKXSQVLCZ63VVZC47F5DIPY4RE
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4KNQGEKXSQVLCZ63VVZC47F5DIPY4RE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 29 Aug 2023 23:06:43 +0200,
Wesley Cheng wrote:
> 
> Several Qualcomm SoCs have a dedicated audio DSP, which has the ability to
> support USB sound devices.  This vendor driver will implement the required
> handshaking with the DSP, in order to pass along required resources that
> will be utilized by the DSP's USB SW.  The communication channel used for
> this handshaking will be using the QMI protocol.  Required resources
> include:
> - Allocated secondary event ring address
> - EP transfer ring address
> - Interrupter number
> 
> The above information will allow for the audio DSP to execute USB transfers
> over the USB bus.  It will also be able to support devices that have an
> implicit feedback and sync endpoint as well.  Offloading these data
> transfers will allow the main/applications processor to enter lower CPU
> power modes, and sustain a longer duration in those modes.
> 
> Audio offloading is initiated with the following sequence:
> 1. Userspace configures to route audio playback to USB backend and starts
> playback on the platform soundcard.
> 2. The Q6DSP AFE will communicate to the audio DSP to start the USB AFE
> port.
> 3. This results in a QMI packet with a STREAM enable command.
> 4. The QC audio offload driver will fetch the required resources, and pass
> this information as part of the QMI response to the STREAM enable command.
> 5. Once the QMI response is received the audio DSP will start queuing data
> on the USB bus.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/Kconfig                 |   15 +
>  sound/usb/Makefile                |    2 +-
>  sound/usb/qcom/Makefile           |    2 +
>  sound/usb/qcom/qc_audio_offload.c | 1813 +++++++++++++++++++++++++++++
>  4 files changed, 1831 insertions(+), 1 deletion(-)
>  create mode 100644 sound/usb/qcom/Makefile
>  create mode 100644 sound/usb/qcom/qc_audio_offload.c
> 
> diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
> index 4a9569a3a39a..da5838656baa 100644
> --- a/sound/usb/Kconfig
> +++ b/sound/usb/Kconfig
> @@ -176,6 +176,21 @@ config SND_BCD2000
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-bcd2000.
>  
> +config QC_USB_AUDIO_OFFLOAD

Keep SND_ prefix for consistency.  And, at best, align with the module
name.

> +	tristate "Qualcomm Audio Offload driver"
> +	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND
> +	select SND_PCM
> +	help
> +	  Say Y here to enable the Qualcomm USB audio offloading feature.
> +
> +	  This module sets up the required QMI stream enable/disable
> +	  responses to requests generated by the audio DSP.  It passes the
> +	  USB transfer resource references, so that the audio DSP can issue
> +	  USB transfers to the host controller.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called qc-audio-offload.

Hmm, you renamed it differently, no?  In the below:

> --- /dev/null
> +++ b/sound/usb/qcom/Makefile
> @@ -0,0 +1,2 @@
> +snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o
> +obj-$(CONFIG_QC_USB_AUDIO_OFFLOAD) += snd-usb-audio-qmi.o

... it's called snd-usb-audio-qmi.


thanks,

Takashi
