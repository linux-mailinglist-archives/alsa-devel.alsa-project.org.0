Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 674322EAEFA
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 16:43:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03BF516A9;
	Tue,  5 Jan 2021 16:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03BF516A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609861430;
	bh=OG9C4J1BFgwS+JDUN+qsXMX0dhS9cwo8lRFqWrqU0kU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sGGu+p6hkfn2rrVL0pyKzUT3kU+KMBTMlQOIITrz5w8IRWbdh4OXnEMIXYNUIffSZ
	 ZWx1X8AuDcmddDeF4A+f6UNJM9GhPA/E/SZrJVU96C7j4rjRlTvIUMQpFfuva0wFQc
	 8UtUXlgew90WT/k85Z8xjiWKjvugCn3TrQfWDACQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEC9EF8027D;
	Tue,  5 Jan 2021 16:42:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6AD9F802C4; Tue,  5 Jan 2021 16:42:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFFDCF8015B;
 Tue,  5 Jan 2021 16:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFFDCF8015B
IronPort-SDR: QFGqjhOiFEYcZ3xQReH7PazEiKQyuYr1xpH0NqnfcbJEcxUPeiOImeVpCe1QtvpUo0s8yYcU57
 H6wf68kuHdGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="176341665"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="176341665"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 07:42:39 -0800
IronPort-SDR: QWCWi2VymOqSN6LRoxlv4ex9o8a4DKmuJppeSYTQc20/GkcXeWOxjVNE+VLptIdH5kuQJ6H/Cc
 qQ8hcGW/cGsA==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="378909382"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 07:42:35 -0800
Date: Tue, 5 Jan 2021 17:39:39 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ALSA: hda: fix SND_INTEL_DSP_CONFIG dependency
In-Reply-To: <CAK8P3a1FZSfzu3TA6VMhqP+3H5OD3+BhH5W=vVYEkL+ExHqpMQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2101051631320.864696@eliteleevi.tm.intel.com>
References: <20210103135257.3611821-1-arnd@kernel.org>
 <3c19a5d5-8883-f917-a96a-f51bb188d115@perex.cz>
 <s5hble491zu.wl-tiwai@suse.de>
 <CAK8P3a1FZSfzu3TA6VMhqP+3H5OD3+BhH5W=vVYEkL+ExHqpMQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Takashi Iwai <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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

Hey,

On Tue, 5 Jan 2021, Arnd Bergmann wrote:

> On Mon, Jan 4, 2021 at 4:05 PM Takashi Iwai <tiwai@suse.de> wrote:
> > As I wrote in another post, a part of the problem is that SOF PCI and
> > ACPI drivers call snd_intel_dsp_driver_probe() unconditionally, even
> > if no Intel driver is bound.
> 
> Makes sense. Is there an existing Kconfig that could be used to
> decide whether the drivers use SND_INTEL_DSP_CONFIG or not?

no, unfortunately not. This is selected per platform in 
sound/soc/sof/intel/Kconfig. CONFIG_SND_SOC_SOF_INTEL_PCI is close, but 
there is at least one platform that does not use SND_INTEL_DSP_CONFIG.

> According to sof_pci_ids[], all PCI IDs are Intel specific, but I can't
> tell which ones need the DSP config.

Indeed currently all the ids are Intel ones (and with exception of old 
Merrifield, all use DSP config). But that's just how it is now.

> Could it be part of the device specific driver_data? 

This would certainly be a clean way and allow to remove the Intel-specific 
calls from sof_pci_probe(). As a short-term solution, IS_REACHABLE() 
seems ok as well.

Br, Kai
