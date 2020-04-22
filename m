Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C371B36E4
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 07:41:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6ACF16D1;
	Wed, 22 Apr 2020 07:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6ACF16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587534071;
	bh=JKETlKZJcO9KYYqRzTx2xXkW6HijHD4VpjJ+E2iJWw0=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CWC3HxqWX2T+RMmmIpcuQdlbmxiOXpZ/ONgpLV7BiPSBWONRCv8+RxlaB5mk2jlPw
	 qlej3nWfVe+phXDsf1UvUwHLWKP1kLG0MLPZmEEpZtd911kZDnfmq8oukhEwQEUw01
	 TWzP7ddQ0zFl9kAkN2bhIQjDRvElPTF08+z1b800=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6DEBF8020C;
	Wed, 22 Apr 2020 07:39:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C272CF801D9; Wed, 22 Apr 2020 07:39:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC4DDF80108
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 07:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC4DDF80108
IronPort-SDR: 9xN3bsDDcrWbQ0C6SXZxUfkXoNZcqaxe1/iipCoOEymmlwHEc04PMrt7eeSdLhJCkc8siL73n4
 o2XTXWkC8KQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 22:39:13 -0700
IronPort-SDR: AboEqZaXGpccJr0IPJJXmM82rMMNExbbsE3I1ZPkQSgGlgX+c/9qqnQGFz1kAYZ34LJHYfJEeA
 INzyAyN1iVBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,412,1580803200"; d="scan'208";a="245882690"
Received: from dtzimme-mobl.amr.corp.intel.com ([10.251.145.143])
 by fmsmga007.fm.intel.com with ESMTP; 21 Apr 2020 22:39:13 -0700
Message-ID: <d20cc18d0fa10b52437e0ac29ea98792e0a3d45d.camel@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC:: don't use snd_soc_rtdcom_lookup()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Tue, 21 Apr 2020 22:39:13 -0700
In-Reply-To: <87d080unyx.wl-kuninori.morimoto.gx@renesas.com>
References: <87d080unyx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 YueHaibing <yuehaibing@huawei.com>, Eason Yen <eason.yen@mediatek.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fontana <rfontana@redhat.com>, linux-mediatek@lists.infradead.org,
 Shunli Wang <shunli.wang@mediatek.com>, Allison Randal <allison@lohutok.net>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <swboyd@chromium.org>,
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

On Wed, 2020-04-22 at 13:46 +0900, Kuninori Morimoto wrote:
> Hi Mark
> Cc related engineer
> 
> These patches are tring to not to use snd_soc_rtdcom_lookup()
> function
> on each drivers as much as possible,  because we might have same name
> component under multi component situation.
> It can't find correct component in such case.
> 
> I tried to add new feature on each drivers to not to use it,
> but I can't test.
> Thus, these patches should get Acked-by or Tested-by from each
> drivers
> user/maintenor. Please test these.
> 
> After these patches, Intel / SOF drivers are still using
> snd_soc_rtdcom_lookup(). Because it is very complex, I couldn't try
> not to use it.
> If possible, each drivers should try to not use it,
> and it should be removed from ASoC.
Morimoti-san,

For my education, I understand the concept of multi-cpu/codec
components, but when or who would need multiple platform components?
This would help me able to remove the snd_soc_rtdcom_lookup() call in
SOF.

Thanks,
Ranjani

