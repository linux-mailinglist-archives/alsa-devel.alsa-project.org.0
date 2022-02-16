Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9764B8AE9
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 14:59:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A72D81933;
	Wed, 16 Feb 2022 14:58:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A72D81933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645019969;
	bh=eHP8xJ9ouNYeuUCl/sa19kh5ew8CETxUkrrgtmuy6b4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MQeOl3Z8JJRl5OlvAfOoWQrwa55V96Kl+R8tXCP/hO8Yx3NraE5aQ+tEfUCExgZMF
	 kYxyb0jPPR1DEo8cZpSr+qYbb8m1vy40Nonh/K+AcFjltgvY1Ndd7S6QhPkVS0pnvL
	 Jyd/A7kP2W8rqEOWVHUyVTMs1ooAQKhEc+E4Jt6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E151CF8012E;
	Wed, 16 Feb 2022 14:58:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 633DAF80128; Wed, 16 Feb 2022 14:58:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5554EF800C0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 14:58:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5554EF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="INRDXONy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645019900; x=1676555900;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=NUZywNCjp2x3V/lFOnPdfgzLfn8unXLbI1WzYGDG5KQ=;
 b=INRDXONyl2XpZYdkL5CoAbi8Hjspl80ravw/qWwkCYhT7mhd2PgZv8I9
 7RgHarSocPFQ3q+hQmbmQUwxCOxmMDNowPQGrk16PtYoPGCuPGE1wMi7m
 jGgfSNRLlPzkgO2wGgZGxD61kpiFpQZq2xptTt9vZUqKcPNWcdHISuXK8
 I+82tBDxTZe9IDfnKg/KaWu8QxKVhxT46VIgNvtnWcfdwkeP0qMrRzcaR
 YlHyDgze18DKbovoQpDjyJhAEz6OQUn+QMZj4C7xdi2WEx7pr0uLALmWJ
 OEIYxunMkxQNdlycCZeS/+TgB091pde1Y0UIeHQ3kTKVglw8TWawl1PHw w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="337040807"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="337040807"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 05:58:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="499102308"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 05:58:09 -0800
Date: Wed, 16 Feb 2022 15:49:26 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: =?ISO-8859-2?Q?Amadeusz_S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: core: unregister clients and machine drivers in
 .shutdown
In-Reply-To: <82363efa-10c4-192e-d8dc-4abeb0f63543@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2202161549160.3088432@eliteleevi.tm.intel.com>
References: <20220215180628.3893282-1-kai.vehmanen@linux.intel.com>
 <82363efa-10c4-192e-d8dc-4abeb0f63543@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: daniel.baluta@nxp.com, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, peter.ujfalusi@linux.intel.com
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

On Wed, 16 Feb 2022, Amadeusz Sławiński wrote:

> On 2/15/2022 7:06 PM, Kai Vehmanen wrote:
> 
> Nitpicking, but I guess "SOF:" got lost in title ;)

thanks Amadeusz, that's indeed true. V2 sent with the correct title.

Br, Kai
