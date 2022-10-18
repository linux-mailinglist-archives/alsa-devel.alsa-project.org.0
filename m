Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5641360354F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 23:57:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86A35A5BC;
	Tue, 18 Oct 2022 23:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86A35A5BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666130231;
	bh=2qRX7DaYPJjgxgFESQftIBhDVL0Fn63RtuEmHiWGNbw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uKpq2J6SmsTBwh70/imcG4+OjSU3W99vsZB6sZxru5ny3qizPX0e23H88zCXQEdz/
	 qqthoxbxKXSWDrEFvX8ylRhS9darU+OFbT9mJebP/GG3IzOxtw+p8MEum000rX/LEi
	 uKSLz5asaXWjznRo19O4rwAmxfediqOcMDpH+mrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10B2DF800AB;
	Tue, 18 Oct 2022 23:56:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2336EF800AB; Tue, 18 Oct 2022 23:56:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A1F4F800AB
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 23:56:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A1F4F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QARby8kE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666130174; x=1697666174;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2qRX7DaYPJjgxgFESQftIBhDVL0Fn63RtuEmHiWGNbw=;
 b=QARby8kEZqdFqJdxZ8hbWMwirguD7y6/gx6I/zcI2vbikyhh+YVSZFxq
 ZtQ26qWLhM6thuKJFULD2+9Xvsx80zEs1fHVANV06VgzdGE2FPKb3Fp2J
 8JSoPON3GwOXM37a+rwre4H2ZuOegmWDUWwLa5XeYflbm7YoREcq21lp2
 PGv1cHYug+ObhPHv9nKlF45J2IRpBIJl7C8C0cI60yECVt3E0HWq+Z8vi
 5V0fhEl3uTGTdVNDsM/t4vN6AfgI1gelxi7mQyFPBvrOwR96SZ8IVqVEJ
 ZCvFJXj2Q7QuASWoOo5yAYY+/4Dz+q1+730vARdXtq9OS3H2nCXNMvQ/+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="306230001"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="306230001"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 14:56:08 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="660015766"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="660015766"
Received: from amdesimo-mobl1.amr.corp.intel.com (HELO [10.213.176.48])
 ([10.213.176.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 14:56:08 -0700
Message-ID: <981dd161-6a4c-c12b-cb1a-826575998457@linux.intel.com>
Date: Tue, 18 Oct 2022 16:56:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH] ASoC: SOF: Intel: pci-tgl: fix ADL-N descriptor
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20221017204131.207564-1-pierre-louis.bossart@linux.intel.com>
 <Y08JoNisQUMadkIf@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Y08JoNisQUMadkIf@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Chao Song <chao.song@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 10/18/22 15:16, Mark Brown wrote:
> On Mon, Oct 17, 2022 at 03:41:31PM -0500, Pierre-Louis Bossart wrote:
>> ADL-N uses a different signing key, which means we can't reuse the
>> regular ADL descriptor used for ADL-P/M/S.
> 
> This breaks an x86 allmodconfig build:
> 
> /build/stage/linux/sound/soc/sof/intel/pci-tgl.c:177:10: error: ‘const struct sof_dev_desc’ has no member named ‘default_lib_path’; did you mean ‘default_fw_path’?
>   177 |         .default_lib_path = {
>       |          ^~~~~~~~~~~~~~~~
>       |          default_fw_path

My bad, this version depends on Peter's series, but it should be
simplified to be applied on stable.

