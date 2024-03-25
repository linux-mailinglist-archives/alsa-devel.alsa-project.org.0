Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6618D88B36D
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:07:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6807D2190;
	Mon, 25 Mar 2024 23:07:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6807D2190
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404462;
	bh=EMiOVf45ss87dGK9cVe/o5M2xwdQcFYlhgc0G6qx4T8=;
	h=From:Date:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ih6Mavq+nKnfJfr+1LqQKFUQrhRjHPxl18TLhf7Xmu1nRo/6kvUpXhUmN2phJvpZo
	 g0meiiAf0Llrp2GYKudsOBBE8pH2l6Nu+Pb8a1lOd/kxz6RW4sG2kZkreQrS457QKF
	 lHk/4WuO4kPXsNwEqQSLabH88f3+0Pv3I92Fsuoo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21F02F805AC; Mon, 25 Mar 2024 23:07:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD2A3F805A9;
	Mon, 25 Mar 2024 23:07:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD76DF8025F; Mon, 25 Mar 2024 23:07:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
	SPF_SOFTFAIL shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi
 [62.142.5.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3D9AF80074
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:07:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D9AF80074
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 01746dfc-eaf4-11ee-a9de-005056bdf889;
	Tue, 26 Mar 2024 00:07:02 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Mar 2024 00:07:01 +0200
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Gergo Koteles <soyer@irl.hu>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ALSA: hda/tas2781: add debug statements to kcontrols
Message-ID: <ZgH1hVH_1-7kFbgp@surfacebook.localdomain>
References: <cover.1711401621.git.soyer@irl.hu>
 <cbdc337b911bee0f80f805b936041fd59c1db54a.1711401621.git.soyer@irl.hu>
 <377e0f33-697c-4baf-ac48-baff6199dd53@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <377e0f33-697c-4baf-ac48-baff6199dd53@linux.intel.com>
Message-ID-Hash: N23U7YD75NB2NZ53Z46CQINAWUYBKRVS
X-Message-ID-Hash: N23U7YD75NB2NZ53Z46CQINAWUYBKRVS
X-MailFrom: andy.shevchenko@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N23U7YD75NB2NZ53Z46CQINAWUYBKRVS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Mon, Mar 25, 2024 at 05:01:18PM -0500, Pierre-Louis Bossart kirjoitti:

...

> > +	dev_dbg(tas_priv->dev, "%s: %d\n", __func__,
> 
> Nit-pick: you don't need to add __func__ to dev_dbg logs, the user can
> add the information with the dyndbg parameter, e.g.
> 
> options snd_intel_dspcfg dyndbg=+pmf
> 
> dev_err/warn don't have this functionality though so in those cases
> there's no replacement for __func__

You beat me up to it, I just downloaded the email thread to say the same.

Since I'm here, I think __func__ in dev_err()/dev_warn() usually says about
poorly written message itself (that it's not unique enough to distinguish
taking into account that this has device instance name as well). While pr_*()
ones indeed may benefit from having it.

-- 
With Best Regards,
Andy Shevchenko


