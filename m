Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD8D2B1277
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 00:06:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F13D184F;
	Fri, 13 Nov 2020 00:05:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F13D184F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605222380;
	bh=2CSKIsXb3eGTQcW5cKkpGlp2Xp8pojoNSByyQq+gtmg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=utKRW4qObzWt1sZ8nfOsKQ4kwkRMsuPeBv3ChmIZHYFu3UUafX4+n/iLsItORyyqN
	 8V8bHhQf2TM1pYxl32ECxw8GhZQ0DG0PLN7nvUolZuMZ/CynAdFvBLmJ4eiAsUK2PY
	 3OXLXJ3ldG6oY/3Rn+e0IeVOUJ6d/6vUARiGRtaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82621F801D5;
	Fri, 13 Nov 2020 00:04:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20055F80161; Fri, 13 Nov 2020 00:04:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AFEDF80059
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 00:04:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AFEDF80059
IronPort-SDR: RFe35mpgK84BIQvE6K8pU2tQ+EzhPl5bGw7rQ/3tYoqS2Fv5bzwA3+V0x9U2C3Cw7z/MamTjn7
 h4v5Llbb2hSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="169611800"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="169611800"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 15:04:16 -0800
IronPort-SDR: ufM/Yhew4yCzbVNjk3ShJG581sUTBKku+PuG4BU0ZmEKVv8fQ8YXKfpxLYVVJ7JKkHixaZVdm/
 SaEjC1p6FcUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="355358550"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by orsmga008.jf.intel.com with ESMTP; 12 Nov 2020 15:04:14 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 12 Nov 2020 23:04:14 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Thu, 12 Nov 2020 23:04:14 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Topic: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Index: AQHWuUTISKj33SVxVku5O7g0f1ygmanFHW9Q
Date: Thu, 12 Nov 2020 23:04:14 +0000
Message-ID: <ef6524c2753a407aba1d4fa98438f54b@intel.com>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "tiwai@suse.de" <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>
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

On 2020-11-12 11:38 PM, Pierre-Louis Bossart wrote:
> The module snd-intel-dspcfg, suggested by Jaroslav last year,
> currently provide the means to select a PCI driver at run-time, based
> on quirks, recommendations or user selection via a kernel
> parameter. This capability removed a lot of confusions in
> distributions and removed the need for recompilations to select legacy
> HDaudio, SST or SOF drivers.
>=20
> This patchset extends the concept to ACPI devices. This was driven by
> the desire to at some point deprecate the Atom/SST driver for Baytrail
> and Cherrytrail, which is no longer maintained by Intel. By having the
> SOF driver enabled by distributions for Baytrail/Cherrytrail, we can
> enable more end-user tests and make the transition easier for
> distributions (likely in 2021 at this point).
>=20
> This patchset provides the same solution for Broadwell, mainly to have
> a single build for all Intel platforms. SOF on Broadwell remains an
> option not recommended for distributions, as long as the 'catpt'
> driver is maintained there is no burning desire to make SOF the
> default on the three Broadwell-based platforms with the DSP
> enabled.
>=20

Hello,

Don't understand why I was omitted in CC for catpt-related patches.

I'll try to do proper review tomorrow as it's late here but for
starters: why do we need any intel-dsp-config changes for non-HDA
platforms, what's the technical reason behind these?

Czarek

