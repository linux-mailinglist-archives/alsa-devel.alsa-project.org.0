Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC9411C348
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 03:30:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 587D316AA;
	Thu, 12 Dec 2019 03:29:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 587D316AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576117846;
	bh=XYDHeiF/JXjDTcs52UnYZu+CEUkBnQqn4LPiN3CRN0I=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jG9pI1dbeqZznCYFh2oWiEV8H95nRymCRFJOba+Gzad0x+60bVkuIZ/mmp8O+iiSS
	 tiVrHufE/9jvLvpeDIs3eTWiEwGSAcic3ITHfQ5Ol7LFNRGg5Y7bzJ39E2MYZ2t7Tc
	 FrzHQ0EK4CdAUrJUGLR+3m4jslJuFajJuAM5Cvio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 226ADF801F4;
	Thu, 12 Dec 2019 03:29:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDDD8F801F4; Thu, 12 Dec 2019 03:28:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27D18F8011E
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 03:28:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27D18F8011E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 18:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,304,1571727600"; d="scan'208";a="415085811"
Received: from aalagiri-mobl.amr.corp.intel.com (HELO [10.254.110.214])
 ([10.254.110.214])
 by fmsmga006.fm.intel.com with ESMTP; 11 Dec 2019 18:28:50 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87pngue4ia.wl-kuninori.morimoto.gx@renesas.com>
 <87o8wee4hf.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e474a207-cb86-988c-3efc-3ed3ec39298a@linux.intel.com>
Date: Wed, 11 Dec 2019 20:28:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87o8wee4hf.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 01/15] ASoC: soc-core: support
 snd_soc_dai_link_component for codec_conf
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/11/19 7:07 PM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> To find codec_conf component, it is using dev_name, of_node.
> But, we already has this kind of finding component method by
> snd_soc_dai_link_component, and snd_soc_is_matching_component().
> We shouldn't have duplicate implementation to do same things.
> This patch adds snd_soc_dai_link_component support to find
> codec_conf component.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks Morimoto-san, this looks good to me, but I couldn't resist a 
small nit-pick below.

> ---
>   include/sound/soc.h  |  3 +++
>   sound/soc/soc-core.c | 18 +++++++++++-------
>   2 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 82e6523..dab1212 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -949,6 +949,7 @@ struct snd_soc_dai_link {
>   #define COMP_CODEC(_name, _dai)		{ .name = _name, .dai_name = _dai, }
>   #define COMP_PLATFORM(_name)		{ .name = _name }
>   #define COMP_AUX(_name)			{ .name = _name }
> +#define COMP_CODEC_CNF(_name)		{ .name = _name }

COMP_CODEC_CONF() ?

CNF is not an acronym/concept we use anywhere else, whereas codec_conf 
is pretty much the default for variable naming.

> -	codec_conf->of_node	= of_node;
> +	codec_conf->dlc.of_node	= of_node;
>   	codec_conf->name_prefix	= str;
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
