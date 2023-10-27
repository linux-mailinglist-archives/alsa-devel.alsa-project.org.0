Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B815D7D9720
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 14:01:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 413D3A4D;
	Fri, 27 Oct 2023 14:00:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 413D3A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698408088;
	bh=vCWGb3NID6ueGa6L0eaadpPpzWEMuC4ODDsq8efeWGk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cyv8kxZkyPzVIxvXup6zwuj6k+K1wRiZd10LDbdMR6wcY0SvUFQ5X/Zv3yx5PUyR/
	 V3CxwdrsQ2nD1T27UuU8QkVB9EFRCul2e1JkEqQKyBD88X4q3lF8f8Z/6bM8uxwIny
	 61uTpQ+w0IqGGQ9xMKF7hwKSj0bfgDNuoIQRbRjo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ADCFF80557; Fri, 27 Oct 2023 14:00:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A29AF80165;
	Fri, 27 Oct 2023 14:00:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11ED5F8019B; Fri, 27 Oct 2023 14:00:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B10A1F8014B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 14:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B10A1F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kUyLPBPH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698408030; x=1729944030;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=vCWGb3NID6ueGa6L0eaadpPpzWEMuC4ODDsq8efeWGk=;
  b=kUyLPBPH5HJdtDSmrjsslemZmUUhgZ41W/QJVEbjvo3ZY5JFTXDv1gmv
   /A5b95a2/zWhj8zFJ0OXhV3P4VTfqUtpXQMVXdwY4X/MFnFJS1xDACtni
   tROgxMetwTLh/vA5rHY1mlcS/TKTglVJ6VcmCDN66Fc9TG6nEOHfTkJFh
   cqY1EgGpBgCBNSBU3SVCnHSzRdhZjTjxgAlhODoREwPWfyNi/h50RXsZE
   hlg6jXib8h9XmPJ5iLtY1+uj4tDkK72YoTdT4K8HvHjppNsADRMQV4xgG
   Jpo2HySisZgyZFoxF+KysOOKXSQTMpZsLV4pZPpGvkiCq6LEJE2Cz+ETw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="367971403"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200";
   d="scan'208";a="367971403"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 05:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="876315699"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200";
   d="scan'208";a="876315699"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 05:00:16 -0700
Message-ID: <54c44548-c2e4-466d-bfe4-b48db9e5d20c@linux.intel.com>
Date: Fri, 27 Oct 2023 14:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [RFC PATCH 0/2] ASoC: soc-dai: add flag to mute and unmute stream
 during trigger.
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
Cc: johan@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
In-Reply-To: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XRVJMQZXC72HFOR44UII3FE7KNZK5Z5H
X-Message-ID-Hash: XRVJMQZXC72HFOR44UII3FE7KNZK5Z5H
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRVJMQZXC72HFOR44UII3FE7KNZK5Z5H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/27/2023 12:57 PM, Srinivas Kandagatla wrote:
> Click/Pop Noise was a long pending issue with WSA Codecs which are prone
> to accumlate DC when ports are active but without any data streams.
> There are multiple places in the current setup, where this could happen
> in both startup as well as shutdown path.
> 
> This patchset adds a new flag mute_unmute_on_trigger to dai_ops to let
> generic code do the mute/unmute on trigger.
> 
> This patches help fix those issues by making sure the PA is Muted/Unmuted
> inline with the stream start/stop events.
> 
> 
> Srinivas Kandagatla (2):
>    ASoC: soc-dai: add flag to mute and unmute stream during trigger
>    ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag
> 
>   include/sound/soc-dai.h    |  1 +
>   sound/soc/codecs/wsa883x.c |  7 +------
>   sound/soc/soc-dai.c        |  7 +++++++
>   sound/soc/soc-pcm.c        | 12 ++++++++----
>   4 files changed, 17 insertions(+), 10 deletions(-)
> 

Have you tried something like:
diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index e40d583a1ce6..f02362cf95dc 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1229,6 +1229,8 @@ static int wsa883x_spkr_event(struct 
snd_soc_dapm_widget *w,
                 snd_soc_component_write_field(component, 
WSA883X_VBAT_ADC_FLT_CTL,
 
WSA883X_VBAT_ADC_COEF_SEL_MASK,
 
WSA883X_VBAT_ADC_COEF_F_1DIV2);
+               snd_soc_component_write_field(component, WSA883X_DRE_CTL_1,
+                                             WSA883X_DRE_GAIN_EN_MASK, 0);
                 snd_soc_component_write_field(component, 
WSA883X_PA_FSM_CTL,
 
WSA883X_GLOBAL_PA_EN_MASK, 0);
                 snd_soc_component_write_field(component, 
WSA883X_PDM_WD_CTL,


As it is one thing from wsa883x_digital_mute() which seems missing in 
SND_SOC_DAPM_PRE_PMD switch case, so it seems to leave GAIN always enabled?

Anyway this seems like something that if possible should be fixed on 
codec driver side instead of introducing global flag?
