Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8808424385
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:58:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7653983D;
	Wed,  6 Oct 2021 18:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7653983D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633539489;
	bh=kviJjdPslXksPN9BfPY8XCmCdjg5SPeAndDnUpa3t6U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C0vbw0aLK9S4Gbg824uvKQXUm9GlpUOw6yOUSQhQiu7xEMwFV+GDZQPtZj1ux1LTo
	 LgAUBWifEyE8nQRbfD5DXSxzWCl54DAIcHjBVaRK2KtbLHr1fmjW8yTk2SxBxq1H7v
	 jYrn1aC94z9PZDpAb5jEYaU/0zUJqnsupsVhWH5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C7C8F804EB;
	Wed,  6 Oct 2021 18:56:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44F34F80424; Wed,  6 Oct 2021 18:56:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53A7FF8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53A7FF8010B
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="226357118"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="226357118"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:52:58 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="439186776"
Received: from nbasa-mobl2.amr.corp.intel.com (HELO [10.213.170.135])
 ([10.213.170.135])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:52:54 -0700
Subject: Re: [PATCH 0/3] Multiple headphone codec driver support
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20211006161805.938950-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <33538866-03a3-4866-2edc-f5fb5928b08f@linux.intel.com>
Date: Wed, 6 Oct 2021 11:50:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006161805.938950-1-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Libin Yang <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bard.liao@intel.com>, Paul Olaru <paul.olaru@oss.nxp.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Gongjun Song <gongjun.song@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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



On 10/6/21 11:18 AM, Brent Lu wrote:
> Support multiple headphone drivers in same machine driver. In this
> case, both rt5682 and rt5682s are supported and enumerated by different
> ACPI HID "10EC5682" and "RTL5682".

Ah, now I get what you're trying to do. I like this a lot!

This is really a 'compatible_id' that the machine driver is capable of
handling.

It would be quite useful indeed to prune some of the tables we have, e.g.

"10EC5640" "10EC5642", "INTCCFFD"
"10EC5645" "10EC5648", etc

In your case you pushed the logic a bit further in that the codec driver
might be different, but the machine driver can deal with it with
run-time autodetection.

Would you mind going through the tables and suggest additional
simplifications with more patches when relevant?

> Brent Lu (3):
>   ASoC: soc-acpi: add alternative id field for machine driver matching
>   ASoC: Intel: sof_rt5682: detect codec variant in probe function
>   ASoC: Intel: sof_rt5682: use id_alt to enumerate rt5682s
> 
>  include/sound/soc-acpi.h                      |  2 ++
>  sound/soc/intel/boards/sof_rt5682.c           | 34 +++----------------
>  .../intel/common/soc-acpi-intel-adl-match.c   |  8 +++++
>  .../intel/common/soc-acpi-intel-byt-match.c   |  6 ++++
>  .../intel/common/soc-acpi-intel-cht-match.c   |  6 ++++
>  .../intel/common/soc-acpi-intel-cml-match.c   |  8 +++++
>  .../intel/common/soc-acpi-intel-icl-match.c   |  6 ++++
>  .../intel/common/soc-acpi-intel-jsl-match.c   | 32 +++++------------
>  .../intel/common/soc-acpi-intel-tgl-match.c   |  8 +++++
>  sound/soc/soc-acpi.c                          | 21 +++++++++++-
>  10 files changed, 76 insertions(+), 55 deletions(-)
> 
