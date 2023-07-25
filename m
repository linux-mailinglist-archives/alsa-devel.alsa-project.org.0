Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7BC760957
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 07:35:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58E4F847;
	Tue, 25 Jul 2023 07:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58E4F847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690263322;
	bh=YhW2JoN+KACizMCG/NzZPeSofxcSWYCPzvLxYlBvZY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=od6blt6XvBkLGinTECeaIqeYkTnJEcntqPuU3sli6YEIS6iiXSJBn5J3028mlg1WV
	 OV8w3Zi2w40lTOKwuS98BEydBce1rKxXYNnf/bDYAuDVki0O8k2aOaTKRG+n27xKiR
	 YyUsGA+e0J+7RgU3i/F9JTH/trccrsWMuF8GGmPo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40EEFF802E8; Tue, 25 Jul 2023 07:34:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC104F80163;
	Tue, 25 Jul 2023 07:34:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 529C2F8019B; Tue, 25 Jul 2023 07:34:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7DA1F80149
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 07:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7DA1F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ntFeGZVr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E129F6152F;
	Tue, 25 Jul 2023 05:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78C2C433C7;
	Tue, 25 Jul 2023 05:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690263240;
	bh=YhW2JoN+KACizMCG/NzZPeSofxcSWYCPzvLxYlBvZY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ntFeGZVrRVnUlxfbKKMVUrc6DPg6tTLkicFGWod9oPP4XgocN8Ek8b7gHbPBuLSRg
	 NztaigcbWOeoNkLS5xYcTfF+TNnP8GOSXCQZBe+FIH1EJ/CAa0wl/qljnrZ3gEYGm0
	 Z0bicpHUe4d+DLAiblPALmxXJrQW10EHrlUym5DY=
Date: Tue, 25 Jul 2023 07:33:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, mathias.nyman@intel.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, Thinh.Nguyen@synopsys.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
	quic_jackp@quicinc.com, pierre-louis.bossart@linux.intel.com,
	oneukum@suse.com, albertccwang@google.com, o-takashi@sakamocchi.jp
Subject: Re: [PATCH v4 12/32] sound: usb: Export USB SND APIs for modules
Message-ID: <2023072542-playtime-charger-dcfc@gregkh>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-13-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725023416.11205-13-quic_wcheng@quicinc.com>
Message-ID-Hash: JOCG72T73ZYV7C2ZDNSQAUBOSMLMG5PY
X-Message-ID-Hash: JOCG72T73ZYV7C2ZDNSQAUBOSMLMG5PY
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JOCG72T73ZYV7C2ZDNSQAUBOSMLMG5PY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 24, 2023 at 07:33:56PM -0700, Wesley Cheng wrote:
> --- a/sound/usb/pcm.c
> +++ b/sound/usb/pcm.c
> @@ -87,7 +87,7 @@ static snd_pcm_uframes_t snd_usb_pcm_pointer(struct snd_pcm_substream *substream
>  /*
>   * find a matching audio format
>   */
> -static const struct audioformat *
> +const struct audioformat *
>  find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
>  	    unsigned int rate, unsigned int channels, bool strict_match,
>  	    struct snd_usb_substream *subs)
> @@ -147,8 +147,9 @@ find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
>  	}
>  	return found;
>  }
> +EXPORT_SYMBOL_GPL(find_format);

This is a horrible symbol name for a global function, same for the other
ones in this file.  If you really want to export them, please put them
in the proper "snd_" prefix namespace, or better yet, use a module
namespace as well to ensure that we know who is using them.

thanks,

greg k-h
