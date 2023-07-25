Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD602760BBE
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 09:28:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AADECEC5;
	Tue, 25 Jul 2023 09:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AADECEC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690270108;
	bh=iwxnDoMneQZpurojbGWHQQCagkeq9KwO0EjAFmmCjRc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yv+eFYDZb+NCp5JtQH2t9IUww6EXEpFPDoah2/kE2Xzyb9q2fj6EQYowl0D7UsDlS
	 dPmOIwo08mUn4g/H/zaAQKGhXb9scPkUPS7C5cq+e2XWGnnIEXPS79cUhPRx7rCxIN
	 Clpq6IX7FvH0jbDYuiGM3LKYSy5tk6QL0yhgRoKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36911F8053B; Tue, 25 Jul 2023 09:27:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58AAFF80163;
	Tue, 25 Jul 2023 09:27:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E05BF8019B; Tue, 25 Jul 2023 09:27:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C89C8F800C7
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 09:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C89C8F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=dUBWqyHb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fPskUvas
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 29D9C1F8B3;
	Tue, 25 Jul 2023 07:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690270018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Xc+x3bm0aDx5lBbs4AFmDsPjM7vKL6WtyoQNR4tK/E=;
	b=dUBWqyHbQwKYt2wSpE/zBet21VuJXKX0vml+r+fr2TY7T0eNHKfjOMemkdeLEOF3L8t7tD
	6HYrViDDuEocyARFPTuFhzfMHOJHE0vbuvYbxVmAqeI6bwngqbxoa0Tjnd/7Qcg3CuRNh0
	kHIUixZr03XkU2opCeRtl5ZU0EyhlpM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690270018;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Xc+x3bm0aDx5lBbs4AFmDsPjM7vKL6WtyoQNR4tK/E=;
	b=fPskUvashiZyTcb/ryCu/ZVCVXchmvSf2JCtlKNdPCRNZFa5H3oOqKqkTxEVVkooX0Rx2q
	Y4nZGIVy99swIbAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9CED513487;
	Tue, 25 Jul 2023 07:26:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id /chyJUF5v2SZFAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 25 Jul 2023 07:26:57 +0000
Date: Tue, 25 Jul 2023 09:26:57 +0200
Message-ID: <87bkg0v4ce.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <agross@kernel.org>,
	<andersson@kernel.org>,
	<robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>,
	<catalin.marinas@arm.com>,
	<will@kernel.org>,
	<mathias.nyman@intel.com>,
	<gregkh@linuxfoundation.org>,
	<lgirdwood@gmail.com>,
	<broonie@kernel.org>,
	<perex@perex.cz>,
	<tiwai@suse.com>,
	<srinivas.kandagatla@linaro.org>,
	<bgoswami@quicinc.com>,
	<Thinh.Nguyen@synopsys.com>,
	<linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-usb@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<quic_jackp@quicinc.com>,
	<pierre-louis.bossart@linux.intel.com>,
	<oneukum@suse.com>,
	<albertccwang@google.com>,
	<o-takashi@sakamocchi.jp>
Subject: Re: [PATCH v4 18/32] sound: usb: Introduce QC USB SND offloading
 support
In-Reply-To: <20230725023416.11205-19-quic_wcheng@quicinc.com>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
	<20230725023416.11205-19-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 3NY5VYSYZZ44OEKFHQPZFMDFWX6F35T2
X-Message-ID-Hash: 3NY5VYSYZZ44OEKFHQPZFMDFWX6F35T2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NY5VYSYZZ44OEKFHQPZFMDFWX6F35T2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jul 2023 04:34:02 +0200,
Wesley Cheng wrote:
> 
> --- a/sound/usb/Kconfig
> +++ b/sound/usb/Kconfig
> @@ -165,6 +165,21 @@ config SND_BCD2000
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-bcd2000.
>  
> +config QC_USB_AUDIO_OFFLOAD
> +	tristate "Qualcomm Audio Offload driver"
> +	depends on QCOM_QMI_HELPERS
> +	select SND_PCM

So the driver can be enabled without CONFIG_SND_USB_AUDIO?  It makes
little sense without it.
Or is it set so intentionally for testing purpose?

About the code:

> +/* Offloading IOMMU management */
> +static unsigned long uaudio_get_iova(unsigned long *curr_iova,
> +	size_t *curr_iova_size, struct list_head *head, size_t size)
> +{
> +	struct iova_info *info, *new_info = NULL;
> +	struct list_head *curr_head;
> +	unsigned long va = 0;
> +	size_t tmp_size = size;
> +	bool found = false;
> +
> +	if (size % PAGE_SIZE) {
> +		dev_err(uaudio_qdev->dev, "size %zu is not page size multiple\n",
> +			size);
> +		goto done;

This can be easily triggered by user-space as it's passed directly
from the mmap call, and it implies that you can fill up the messages
easily.  It's safer to make it debug message or add the rate limit.

Ditto for other error messages.

> +static void disable_audio_stream(struct snd_usb_substream *subs)
> +{
> +	struct snd_usb_audio *chip = subs->stream->chip;
> +
> +	if (subs->data_endpoint || subs->sync_endpoint) {
> +		close_endpoints(chip, subs);
> +
> +		mutex_lock(&chip->mutex);
> +		subs->cur_audiofmt = NULL;
> +		mutex_unlock(&chip->mutex);
> +	}

Now looking at this and...

> +static int enable_audio_stream(struct snd_usb_substream *subs,
> +				snd_pcm_format_t pcm_format,
> +				unsigned int channels, unsigned int cur_rate,
> +				int datainterval)
> +{

... this implementation, I wonder whether it'd be better to modify and
export  snd_usb_hw_params() snd snd_usb_hw_free() to fit with qcom
driver.  Then you can avoid lots of open code.

In general, if you see a direct use of chip->mutex, it can be often
done better in a different form.  The use of an internal lock or such
from an external driver is always fragile and error-prone.

Also, the current open-code misses the potential race against the
disconnection during the operation.  In snd-usb-audio, it protects
with snd_usb_lock_shutdown() and snd_usb_unlock_shutdown() pairs.

> +static int __init qc_usb_audio_offload_init(void)
> +{
> +	struct uaudio_qmi_svc *svc;
> +	int ret;
> +
> +	ret = snd_usb_register_platform_ops(&offload_ops);
> +	if (ret < 0)
> +		return ret;

Registering the ops at the very first opens a potential access to the
uninitialized stuff.  Imagine a suspend happens right after this
point.  As the ops is already registered, it'll enter to the
suspend_cb callback and straight to Oops.

> +static void __exit qc_usb_audio_offload_exit(void)
> +{
> +	struct uaudio_qmi_svc *svc = uaudio_svc;
> +
> +	qmi_handle_release(svc->uaudio_svc_hdl);
> +	flush_workqueue(svc->uaudio_wq);
> +	destroy_workqueue(svc->uaudio_wq);
> +	kfree(svc);
> +	uaudio_svc = NULL;
> +	snd_usb_unregister_platform_ops();

Similarly, the unregister order has to be careful, too.


thanks,

Takashi
