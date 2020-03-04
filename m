Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B86D1796DF
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 18:39:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D23381660;
	Wed,  4 Mar 2020 18:38:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D23381660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583343563;
	bh=oJV6cWMvSBhgF/VtJNFXzFbAsIarcYa5PXP3EMTgii4=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SR4PCgwBgy4PaHPt24gm0u2I7V5uirj00Z3o/FE1lvOshevy0ql+VslQp9+v+eMse
	 AkvQGFWat38M28NMXmeU7nzS0BYx/By6EbfomSTkEdhbCF1yJNHRWb7QRZHRNuX7Tv
	 n2aYFkHGOc0zn2r3T6Q3hkJkERQMDVA/aOIPNNu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF1ADF801EC;
	Wed,  4 Mar 2020 18:37:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B12A1F801ED; Wed,  4 Mar 2020 18:37:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48123F8011C
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 18:37:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48123F8011C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 09:37:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,514,1574150400"; d="scan'208";a="229399961"
Received: from ayeshakh-mobl.amr.corp.intel.com ([10.252.205.163])
 by orsmga007.jf.intel.com with ESMTP; 04 Mar 2020 09:37:32 -0800
Message-ID: <b524cb9c2c61bf90087ad7174a84b754143d376a.camel@linux.intel.com>
Subject: Re: [RFC PATCH v2 0/2] Introduce multi PM domains helpers
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, rjw@rjwysocki.net, 
 len.brown@intel.com
Date: Wed, 04 Mar 2020 09:37:32 -0800
In-Reply-To: <20200304121943.28989-1-daniel.baluta@oss.nxp.com>
References: <20200304121943.28989-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: aisheng.dong@nxp.com, ulf.hansson@linaro.org, festevam@gmail.com,
 alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 gregkh@linuxfoundation.org, s.hauer@pengutronix.de, khilman@kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 paul.olaru@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org, daniel.baluta@nxp.com, shengjiu.wang@nxp.com,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 2020-03-04 at 14:19 +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> i.MX8QXP/i.MX8QM has IPs that need multiple power domains to be up
> in order to work. In order to help drivers, we introduce multi PM
> domains helpers that are able to activate/deactivate multi PM
> domains.
> 
> First patch introduces the helpers and second patch demonstrates how
> a driver can use them instead of hardcoding the PM domains handling.
> 
> Changes since v1: (addressed Ranjani's comments)
> 	- enhanced description for dev_multi_pm_attach return value
> 	- renamed exit_unroll_pm label to exit_detach_pm
> 
> Daniel Baluta (2):
>   PM / domains: Introduce multi PM domains helpers
>   ASoC: SOF: Use multi PM domains helpers
Both patches LGTM. Thanks Daniel.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

