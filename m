Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2316C3307
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 14:37:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9683F1FE;
	Tue, 21 Mar 2023 14:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9683F1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679405840;
	bh=Q/pZBiOvWmfzws0dgFOxHl76o/p6fw/aP4l5e37PI2g=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r2YQ1hQudMT39ESH5abnnSadANjLQnwkb3TB9QHklbeQD4qJQulWLJMOmGk0Ua8La
	 BbhA8oUmMQBXg+01b1XWYnA1VXyJcwNojTTsy6DMDtz3w/gEmggDH3BxoxfqlXrP37
	 9BmfV1F788JorZ8zWGb1wKQ+qf5f4c6eRADgkHCQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FF60F80254;
	Tue, 21 Mar 2023 14:36:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3206CF8027B; Tue, 21 Mar 2023 14:36:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3D93F800C9
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 14:36:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3D93F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RVj1M5lS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679405783; x=1710941783;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Q/pZBiOvWmfzws0dgFOxHl76o/p6fw/aP4l5e37PI2g=;
  b=RVj1M5lSDCYQly43JW+3T+1YJqkeOQ+KtZx82dNCte8f9tyD/8borbcY
   jNc0vt8aved+lpNnZA9V0iDBSaymKEnCd3StSBkZykg6mjsKjNt5ZM6dF
   8VZSm7RMA6rmd1sb6dRICHXpwHhM8iRxXTd/L9XXBlR+BqB0h0oxZLIz/
   yWY6x4f16VnNhX3aF8913JRL/V1R9B7dXlijD1DOYRRBQ1DX242ZfJqtJ
   xSWX4RA9FBZRvDk8+dOTVzKjIKzYcMKNnDTuWOeXC+HAtdN0P6NiVqKoH
   PohVdUBfZ158GbwBHcos3mxpDjZrQJUjyEvHNEJOV0J6PjeOtEkTwv+v3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="401507409"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400";
   d="scan'208";a="401507409"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 06:36:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792088425"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400";
   d="scan'208";a="792088425"
Received: from markusbu-mobl.ger.corp.intel.com (HELO [10.252.60.215])
 ([10.252.60.215])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 06:36:18 -0700
Message-ID: <6be945d2-40cb-46fb-67ba-ed3a19cddfa4@linux.intel.com>
Date: Tue, 21 Mar 2023 15:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [bug report] ASoC: SOF: ipc4-control: Add support for bytes
 control get and put
To: Dan Carpenter <error27@gmail.com>
References: <4c3570c3-67fe-4b58-baaf-455f69bdfc6b@kili.mountain>
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <4c3570c3-67fe-4b58-baaf-455f69bdfc6b@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XA3Z4X5EBGAEX3YWQDC7QVIJXA7AGJ4E
X-Message-ID-Hash: XA3Z4X5EBGAEX3YWQDC7QVIJXA7AGJ4E
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XA3Z4X5EBGAEX3YWQDC7QVIJXA7AGJ4E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Dan,

On 21/03/2023 09:21, Dan Carpenter wrote:
> Hello Peter Ujfalusi,
> 
> The patch a062c8899fed: "ASoC: SOF: ipc4-control: Add support for
> bytes control get and put" from Mar 13, 2023, leads to the following
> Smatch static checker warning:
> 
> 	sound/soc/sof/ipc4-control.c:436 sof_ipc4_widget_kcontrol_setup()
> 	warn: iterator used outside loop: 'scontrol'
> 
> sound/soc/sof/ipc4-control.c
>     411 static int sof_ipc4_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
>     412 {
>     413         struct snd_sof_control *scontrol;
>     414         int ret = 0;
>     415 
>     416         list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
>     417                 if (scontrol->comp_id == swidget->comp_id) {
>     418                         switch (scontrol->info_type) {
>     419                         case SND_SOC_TPLG_CTL_VOLSW:
>     420                         case SND_SOC_TPLG_CTL_VOLSW_SX:
>     421                         case SND_SOC_TPLG_CTL_VOLSW_XR_SX:
>     422                                 ret = sof_ipc4_set_volume_data(sdev, swidget,
>     423                                                                scontrol, false);
>     424                                 break;
>     425                         case SND_SOC_TPLG_CTL_BYTES:
>     426                                 ret = sof_ipc4_set_get_bytes_data(sdev, scontrol,
>     427                                                                   true, false);
>     428                                 break;
> 
> This breaks out of the switch statement and not the loop.  So that means
> that it will continue through the loop and ret is reset.
> 
>     429                         default:
>     430                                 break;
>     431                         }
>     432                 }
>     433         }
>     434 
>     435         if (ret < 0)
> --> 436                 dev_err(sdev->dev, "kcontrol %d set up failed for widget %s\n",
>     437                         scontrol->comp_id, swidget->widget->name);
>                                 ^^^^^^^^^^^^^^^^^
> "scontrol" cannot be a valid pointer at this stage.  It is always an
> offset off the &sdev->kcontrol_list because of the above issue.

This is valid in a semantics sense and I will fix it.
In real life we have single control per swidget and this should have
been one step up.

> 
>     438 
>     439         return ret;
>     440 }
> 
> regards,
> dan carpenter

-- 
Péter
