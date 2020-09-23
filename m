Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B85CA275489
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 11:28:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE5C9172E;
	Wed, 23 Sep 2020 11:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE5C9172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600853318;
	bh=IxOoVTxSE8/X2fdD3t7NY0FO+ygTmUf7ez4mwW/mW2Q=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g+cA7twR8y6CpYhR5JVWfVdcLH7OfxPOUoJO2mFQUfwtApaBKGNLifTH6xRY3Dw+/
	 eKpi6fT3O5g7y1+3vUsjg2MA4S9KW0FQhnOvonJWvmRKyuxyTF3NA+G8QhlVOboGQu
	 Rf1p9trzpFPVHN6yW+fDwOQs+OP3Bl1jd0eaC2QA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23BF6F800B4;
	Wed, 23 Sep 2020 11:26:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FB8CF80171; Wed, 23 Sep 2020 11:26:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60FADF800B4
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 11:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60FADF800B4
IronPort-SDR: 60iz/ZUGeKt5mkc9x6Q2sYiUGkUVQHHdrTTXNBRD49SG8hKUWuMaahrlUzTqO9gKXNoF3Dukhy
 4ncbfTeAuztQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="178907839"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="178907839"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 02:26:41 -0700
IronPort-SDR: 55RBMWP5lxcU55p4cSMsuJunP00KQboHKpLlIUR66jYHQe+phK/fWjovhAcLSF1MI7ssKnWztL
 3hOJvkLsmRmg==
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="486367262"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 02:26:38 -0700
Date: Wed, 23 Sep 2020 12:25:05 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 5/6] ASoC: Intel: sof_sdw_rt700: add codec prefix
In-Reply-To: <b9481c23-5a09-0518-b05b-c01b2d04e102@perex.cz>
Message-ID: <alpine.DEB.2.22.394.2009231213470.3186@eliteleevi.tm.intel.com>
References: <20200923080514.3242858-1-kai.vehmanen@linux.intel.com>
 <20200923080514.3242858-6-kai.vehmanen@linux.intel.com>
 <b9481c23-5a09-0518-b05b-c01b2d04e102@perex.cz>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-ID: <alpine.DEB.2.22.394.2009231223050.3186@eliteleevi.tm.intel.com>
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

Hi,

On Wed, 23 Sep 2020, Jaroslav Kysela wrote:

> Dne 23. 09. 20 v 10:05 Kai Vehmanen napsal(a):
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > --- a/sound/soc/intel/boards/sof_sdw_rt700.c
> > +++ b/sound/soc/intel/boards/sof_sdw_rt700.c
> > @@ -23,9 +23,9 @@ static const struct snd_soc_dapm_widget rt700_widgets[] = {
> >  
> >  static const struct snd_soc_dapm_route rt700_map[] = {
> >  	/* Headphones */
> > -	{ "Headphones", NULL, "HP" },
> > -	{ "Speaker", NULL, "SPK" },
> > -	{ "MIC2", NULL, "AMIC" },
> > +	{ "Headphones", NULL, "rt700 HP" },
> > +	{ "Speaker", NULL, "rt700 SPK" },
> 
> > +	{ "rt700 MIC2", NULL, "AMIC" },
> 
> This line looks suspicious. Perhaps, the prefix should be added before AMIC ?

I believe this is still correct. We prefix the codec-side entry of the 
dapm routes with codec string and here MIC2 is the codec. This is aligned 
with existing code for 711 in sof_sdw_rt711.c:

static const struct snd_soc_dapm_route rt711_map[] = {
»       /* Headphones */
»       { "Headphone", NULL, "rt711 HP" },
»       { "rt711 MIC2", NULL, "Headset Mic" },
};

Br, Kai
