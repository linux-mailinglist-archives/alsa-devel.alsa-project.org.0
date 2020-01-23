Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF1014638B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 09:33:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B02BE166D;
	Thu, 23 Jan 2020 09:32:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B02BE166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579768399;
	bh=h/ec/EMmFjaZlstQ/mB0+CT8Yex16OH3P6nXefy9pus=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AHxz6cis42Mt86RSbJvHwyugYby2msAeEzy3vbwXUc2gnew1tGf+jsb3EFWuVYy7j
	 A2Dpk9ruesZVfQ1ejd76+FxBjjjmZEgTCnSEQcrapottISF4z/XdcX6+ThsJYt7CsC
	 30Kn8cCRaNm09gTf/7VJsfUsYOoyZqUu+WxL4FgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D49FF801ED;
	Thu, 23 Jan 2020 09:31:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BAE4F801D9; Thu, 23 Jan 2020 09:31:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36FCFF80112
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 09:31:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36FCFF80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 00:31:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,353,1574150400"; d="scan'208";a="307772424"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001.jf.intel.com with ESMTP; 23 Jan 2020 00:31:24 -0800
Date: Thu, 23 Jan 2020 10:31:23 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <0c4a19c3-f1e3-7b76-be42-e4902645955b@linux.intel.com>
Message-ID: <alpine.DEB.2.21.2001230951530.2957@eliteleevi.tm.intel.com>
References: <20200122181254.22801-1-cezary.rojewski@intel.com>
 <0c4a19c3-f1e3-7b76-be42-e4902645955b@linux.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-ID: <alpine.DEB.2.21.2001231012531.2957@eliteleevi.tm.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: skl_hda_dsp_common: Fix
 global-out-of-bounds bug
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Wed, 22 Jan 2020, Pierre-Louis Bossart wrote:

> On 1/22/20 12:12 PM, Cezary Rojewski wrote:
> > Definitions for idisp snd_soc_dai_links within skl_hda_dsp_common are
> > missing platform component. Add it to address following bug reported by
> > KASAN:
[...]
> > [   10.538502] BUG: KASAN: global-out-of-bounds in
> > skl_hda_audio_probe+0x13a/0x2b0 [snd_soc_skl_hda_dsp]
> > [   10.538509] Write of size 8 at addr ffffffffc0606840 by task
> > systemd-udevd/299
> > (...)
> =

> You could probably skip the call trace, it doesn't really provide much
> information.
> =

> Kai and Ranjani, do you think this impacts SOF as well? Or does our BE
> override somehow suppresses the problem?

yes, this is a good catch Cezary! We actually initialize the platform =

correctly in other machine drivers, so this is a specific bug in the =

generic HDA mach driver.

What happens is that 'platforms' is initialized to an empty array:

static struct snd_soc_dai_link_component idisp1_cpus[] =3D { { .dai_name =
=3D "iDisp1 Pin", } }; =

static struct snd_soc_dai_link_component idisp1_codecs[] =3D { { .name =3D =
"ehdaudio0D2", .dai_name =3D "intel-hdmi-hifi1", } };
static struct snd_soc_dai_link_component idisp1_platforms[] =3D { }

... but then before card registration, mach driver code assumes there is =

at least one platform in the array:

=BB       for_each_card_prelinks(card, i, dai_link)                      =

=BB       =BB       dai_link->platforms->name =3D mach_params->platform; =


... and this results in out-of-bound write.

Cezary's patch is aligned with other machine drivers and typical ASOC
macro usage so:

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

I'll check if other machine drivers are impacted as well.

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
