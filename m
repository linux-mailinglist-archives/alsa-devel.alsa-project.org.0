Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9C675EEC0
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 11:12:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 743A3207;
	Mon, 24 Jul 2023 11:11:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 743A3207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690189930;
	bh=R8MoBTG8FHXPKYM/dy8lKyFiiYXOSBv/75gFE2jR2Y4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M5hXCqr0PjxeNndu8q+QUGim6oy+8jqXei0VY547FOXlwixantBxeOh7CLWX58tEN
	 Jp19PfXhEopHh2K4Ljm/7G8W8v7rywj4hkwd4k/0bu9b740Zv67w9/mLzb5cYVWFoR
	 qWgoHbo53C28EMcFxHj22MPf1ts7x/LS9bTjoKWY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7875F80548; Mon, 24 Jul 2023 11:11:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6917CF80163;
	Mon, 24 Jul 2023 11:11:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 014ADF8019B; Mon, 24 Jul 2023 11:11:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 141E0F80153
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 11:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 141E0F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fPV0dOLt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690189870; x=1721725870;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=R8MoBTG8FHXPKYM/dy8lKyFiiYXOSBv/75gFE2jR2Y4=;
  b=fPV0dOLtRjCa01ZnGksL1aSjzWmKyfzpTrIrb1B8z2Ia8tmCzeBJDetn
   KXQwZB69ar0kpTCS7zv5msps5cxMsQUkKalfuSMSpJP53H3O/6uvrBvrn
   YkXIRct8CE9ksQwg5AjBA+rIYnJOYPAkbpCjKRkIg7I9P02c3WO3hceJx
   jTSbpIL7mMAzAAvXjEyyB5AdV9sSW2hLLe0E3Y+X0cO5sIcGL3rXgclbs
   g1PqxS2sOrJrJc1GpTmPKBpjrm9vDglUyy/jZMCQA2xaoM6cJxlqc0Bog
   RJ4v6ejDxNqadLWxG9HGmFBWgeTtfUv0K6thjSGHDd2tvJ9q3+h8LIHUW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="370060526"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200";
   d="scan'208";a="370060526"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:11:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="1056353705"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200";
   d="scan'208";a="1056353705"
Received: from sosterlu-mobl.ger.corp.intel.com (HELO [10.249.37.56])
 ([10.249.37.56])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:11:02 -0700
Message-ID: <10dc2616-0cc3-8827-b46b-ebea8874ac73@linux.intel.com>
Date: Mon, 24 Jul 2023 11:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: fix application of sizeof to
 pointer
Content-Language: en-US
To: sunran001@208suo.com, perex@perex.cz, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
References: <20230720073836.3285-1-xujianghui@cdjrlc.com>
 <74739aaaa05f52084757b526bc8348c8@208suo.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <74739aaaa05f52084757b526bc8348c8@208suo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GLZPINBZXSWQAQDNGADQIAIBPQU4BDVJ
X-Message-ID-Hash: GLZPINBZXSWQAQDNGADQIAIBPQU4BDVJ
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GLZPINBZXSWQAQDNGADQIAIBPQU4BDVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/20/23 10:43, sunran001@208suo.com wrote:
> The coccinelle check report:
> ./drivers/scsi/csiostor/csio_mb.c:1554:46-52: ERROR: application of
> sizeof to pointer
> 
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  sound/soc/sof/ipc4-topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
> index a4e1a70b607d..2dbe87dbd239 100644
> --- a/sound/soc/sof/ipc4-topology.c
> +++ b/sound/soc/sof/ipc4-topology.c
> @@ -218,7 +218,7 @@ static int sof_ipc4_get_audio_fmt(struct
> snd_soc_component *scomp,
> 
>      ret = sof_update_ipc_object(scomp, available_fmt,
>                      SOF_AUDIO_FMT_NUM_TOKENS, swidget->tuples,
> -                    swidget->num_tuples, sizeof(available_fmt), 1);
> +                    swidget->num_tuples, sizeof(*available_fmt), 1);
>      if (ret) {
>          dev_err(scomp->dev, "Failed to parse audio format token count\n");
>          return ret;

you need to Cc: maintainers and SOF folks who are knowledgeable on IPC4.
