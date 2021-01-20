Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1A82FD509
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 17:14:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16EB517B5;
	Wed, 20 Jan 2021 17:13:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16EB517B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611159274;
	bh=g5aWV2ZsXwSqlneM7lI/8CqFlg2yHZwYDF7X3lUPXm4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rsYTA7+Sai2ELF517kqSJ6m0sD4vXUZXWlnK+ldPxucHZ6Gb4AAVc5LATMI0nrlLw
	 LtL2kUebyvgYzgiHm9uwTzcvBTTE1rIMCFg3CGSU5xHcRfpkI4pUOqK+6g0zuMsQWn
	 3xIhQkH8zmNkTiUwF21bLaz4cgHPy6WrhwKFELCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA4D6F8019B;
	Wed, 20 Jan 2021 17:13:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E99EDF8016E; Wed, 20 Jan 2021 17:12:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PDS_BAD_THREAD_QP_64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A584F80164
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 17:12:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A584F80164
IronPort-SDR: E0p5kX2/x3M7lsGnQ4H0lq5YsrNtkJBk+NkHwa12izqYugYLVqU+kxX0CoLbF2ntK5OJCQA+4q
 at0VEmJoIp6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="243202275"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="243202275"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 08:12:47 -0800
IronPort-SDR: r4xfOhO7EnCqsrR5Pks3sKCwlJtDKyEOyPs9w1LJ+jLj8AhoQ7Ip8GeurbkQ8TGm7ncZeiqWhi
 xFJJonZ8l6iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="366297741"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by orsmga002.jf.intel.com with ESMTP; 20 Jan 2021 08:12:46 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 20 Jan 2021 16:12:45 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Wed, 20 Jan 2021 16:12:45 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Takashi Iwai <tiwai@suse.de>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 1/3] ASoC: intel: skl: Simplify with
 dma_set_mask_and_coherent()
Thread-Topic: [PATCH 1/3] ASoC: intel: skl: Simplify with
 dma_set_mask_and_coherent()
Thread-Index: AQHW6nouJikQ0U2CKkGNq1grs7X506owuLSw
Date: Wed, 20 Jan 2021 16:12:45 +0000
Message-ID: <45d36cfa12ed4f8885f678d642d15f0a@intel.com>
References: <20210114133337.1039-1-tiwai@suse.de>
 <20210114133337.1039-2-tiwai@suse.de>
In-Reply-To: <20210114133337.1039-2-tiwai@suse.de>
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
Cc: Mark Brown <broonie@kernel.org>
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

On 2021-01-14 2:33 PM, Takashi Iwai wrote:
> ASoC Intel Skylake driver still has explicit calls of dma_set_mask()
> and dma_set_coherent_mask().
>=20
> Let's simplify with dma_set_mask_and_coherent().
>=20
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Somehow CC did not get to me.

Thanks for the patch, Takashi. Small nitpick: s/skl/Skylake/ in
commit's title. No need for resend if that's the only missing piece
found.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

