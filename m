Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED55C64EE86
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 17:07:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9C0516FC;
	Fri, 16 Dec 2022 17:06:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9C0516FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671206839;
	bh=l7H2yfCs/IMIVq+B/pOD2NdX6bHZs2ePX/ftqWatWlY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nZunwmLXtzGio8Orkg+rx8J8pJOccUqFYqDIeeqFupeAivCFojsZedwHFXxmKjR2/
	 nekL8hForfMPecieSkn2M9yLJvCeJGUXvMzPia952S/AO3sR+XG3cnphUe9B25Lm0i
	 ohXwRmIOSkLFAFk7QSe00WTPm4+bOcFwgKQuXe+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E85C8F804F1;
	Fri, 16 Dec 2022 17:06:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2B2EF804E0; Fri, 16 Dec 2022 17:06:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8B01F804D0
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 17:06:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8B01F804D0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lEm5cbyK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671206768; x=1702742768;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=l7H2yfCs/IMIVq+B/pOD2NdX6bHZs2ePX/ftqWatWlY=;
 b=lEm5cbyKA717LwAMnIMVeqTPzB42X/TueXsn0NFtpIzTaMWg6bP7ojXb
 eF2rFG+PdL+W/UkcYAXG7ShAs3pVZHhpfvyNIxtXsdR1STR/w2VuwTaOx
 uuYPAh/583/Wk08rAwSBXhj4FBxtzCo0lacUEX/a4Yo22KOGTZt3+h+4U
 Tdk/PD+AiAUo4IFufeV15Gtsg1hRESTonSCqExhO5LuK0aTC9sicHKHRx
 FuBMoHD2h95dZGzAAqILHT40tftWluWCSwnXdVgOrRuTPUquR7ojIAf/R
 kLQ+CKDUH5TV0FdeBzJShKdExdeTYHxEYHI2PCx6ebOFxIV/u2O+Y1/55 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="319049002"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="319049002"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:05:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="627594959"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="627594959"
Received: from krojasle-mobl.amr.corp.intel.com (HELO [10.209.187.31])
 ([10.209.187.31])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:05:47 -0800
Message-ID: <f479858c-b7dd-5af6-c0f1-c119737a7cc0@linux.intel.com>
Date: Fri, 16 Dec 2022 10:05:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2] ASoC: Intel: sof_nau8825: add variant with nau8318
 amplifier.
Content-Language: en-US
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
References: <20221216154938.9426-1-ajye_huang@compal.corp-partner.google.com>
 <CALprXBYwNaHCe+EO9G_SvWg2HNVAz62KzaaxGCb1PssJshXUzQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CALprXBYwNaHCe+EO9G_SvWg2HNVAz62KzaaxGCb1PssJshXUzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Libin Yang <libin.yang@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "balamurugan . c" <balamurugan.c@intel.com>, Mark Brown <broonie@kernel.org>,
 Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, David Lin <CTLIN0@nuvoton.com>,
 alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



> The v2 includes:
> changes from v1->v2:
> * Modify title and add explanations in commit messages .
> * Use new topology file "sof-adl-nau8318-nau8825.tplg" instead of
> sof-adl-max98360a-nau8825.tplg.

You can add those directly in the patch, below the --- marker, e.g.


Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---

changes from v1->v2:
* Modify title and add explanations in commit messages .
* Use new topology file "sof-adl-nau8318-nau8825.tplg" instead of
sof-adl-max98360a-nau8825.tplg.

 sound/soc/intel/boards/Kconfig                |  1 +
 sound/soc/intel/boards/sof_nau8825.c          | 23 +++++++++++++++++++
 .../intel/common/soc-acpi-intel-adl-match.c   | 12 ++++++++++
 3 files changed, 36 insertions(+)
