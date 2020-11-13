Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 674492B1B95
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 14:08:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB4CA186E;
	Fri, 13 Nov 2020 14:07:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB4CA186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605272918;
	bh=v11ZlHYNnDUEypQWacVAiKh/oQAwfWIvfbPkcIIyVUQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QV04o2L2bW6UOZinIdTW7IK22Py4Gp3Fgz56lfIoNZ5knAKj4VJ6TKYRumPQqWvOy
	 VCICFw8lBuF73auErqO/idIY9xB/HdHqoV4Vg4OMuFRGx0YUrkdW0J39h9GXm6OElP
	 30r1kS5NYGC1Vjj7rZmw/+GoPLFsx56eNF6RfvTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 697E8F8022B;
	Fri, 13 Nov 2020 14:07:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79385F8020C; Fri, 13 Nov 2020 14:07:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A20DF80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 14:06:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A20DF80086
IronPort-SDR: mVHnho52S5GD5OfrJJXQuj69buYI8XY4XTM1S+3kDjhXIr3eeCIdlf2v7Po3yXhohFibVrs2Da
 RsHwu+63iOJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="166959459"
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="166959459"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 05:06:50 -0800
IronPort-SDR: cbGFBPto0GfpkWrRJDwllScCQAI6QWvg54F7F4coKMJjY5vKGcYDSRv+Aj7m/ovAhDQcj4V5Kl
 w0JcqbVelimg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="532563870"
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137])
 by fmsmga005.fm.intel.com with ESMTP; 13 Nov 2020 05:06:49 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Nov 2020 13:06:48 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Fri, 13 Nov 2020 13:06:48 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Topic: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Index: AQHWuUTISKj33SVxVku5O7g0f1ygmanF+0Xg
Date: Fri, 13 Nov 2020 13:06:48 +0000
Message-ID: <0a0854d1ddaf4f9b81ef5569a7d501a5@intel.com>
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
 "broonie@kernel.org" <broonie@kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
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

On 2020-11-13 12:04 AM, Rojewski, Cezary wrote:
> On 2020-11-12 11:38 PM, Pierre-Louis Bossart wrote:
>> The module snd-intel-dspcfg, suggested by Jaroslav last year,
>> currently provide the means to select a PCI driver at run-time, based
>> on quirks, recommendations or user selection via a kernel
>> parameter. This capability removed a lot of confusions in
>> distributions and removed the need for recompilations to select legacy
>> HDaudio, SST or SOF drivers.
>>
>> This patchset extends the concept to ACPI devices. This was driven by
>> the desire to at some point deprecate the Atom/SST driver for Baytrail
>> and Cherrytrail, which is no longer maintained by Intel. By having the
>> SOF driver enabled by distributions for Baytrail/Cherrytrail, we can
>> enable more end-user tests and make the transition easier for
>> distributions (likely in 2021 at this point).
>>
>> This patchset provides the same solution for Broadwell, mainly to have
>> a single build for all Intel platforms. SOF on Broadwell remains an
>> option not recommended for distributions, as long as the 'catpt'
>> driver is maintained there is no burning desire to make SOF the
>> default on the three Broadwell-based platforms with the DSP
>> enabled.
>>
>=20
> Hello,
>=20
> Don't understand why I was omitted in CC for catpt-related patches.
>=20
> I'll try to do proper review tomorrow as it's late here but for
> starters: why do we need any intel-dsp-config changes for non-HDA
> platforms, what's the technical reason behind these?
>=20
> Czarek
>=20

As almost all of the patches share the concerns, decided to provide
entire output here so it's easier to navigate later on.

For a very long time upstream was filled with "flavors" of drivers for
Intel solutions. Having three available for BYT is a very good example
of that. The division of what goes where wasn't exactly explicit either.
This all leads to confusion - while community and users may feel
confused about what's recommended and what they should actually be
using, surprisingly (unsurprisingly?) developers were too.

Latest changes provided by Intel employees were addressing exactly that.
Removal of obsolete and redundant code. Together with fixing several
issues that were bothering users of older solutions, net gain was:
reduction of confusion and complexity factors.

Patchset presented here goes directly against that goal. We, Intel
developers, are tasked with providing reliable, working solutions
exposing best possible experience for our customers when dealing with
our products. And thus solutions provided are called recommended. We
don't deal with flavors and try-it-out-on-your-own-risk.

Moreover, intel-dsp-config module was created to address completely
different problem - problem of selecting correct HDA driver given the
circumstances. This is true as one cannot always rely on DSP-capability
bit being enabled when HDA-legacy is meant to be the default solution on
given platform. In future maybe we should revisit that subject once
again as perhaps even the existing solution isn't resolving the problem
completely.

Neither HSW/BDW nor atom-based platforms are HDA-based. Those are ACPI
devices and you know upfront what we're dealing with. There is no
DSP-capability bit to check for to know whether we're dealing with
legacy solution or not. As these are explicit configurations, one needs
not to bother with additional magic enums.

As long as Intel recommendation stays with /atom/ for atom-based
products, so should linux kernel.
Same for hsw/bdw - Intel recommends closed firmware solution and thus
this should remain as the only available choice - leaving no place for
confusion.

Once and if SOF is ready to support all available atom configuration, it
should deprecate and replace it with the same fashion catpt replaced its
predecessor. Until that moment, things should remain as they are. No
additional quirks or magic, just plain simple ACPI-ID based selection.

Users that are making use of optional and opportunistic changes
especially in regard to selecting not-recommended choices are
experienced enough to rebuild their kernel and merge out-of-tree changes
and they are free to do so if they want to. Upstream kernel, however, is
not place for keeping such code.

Czarek

