Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE0F28D8BD
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 04:58:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E168116C1;
	Wed, 14 Oct 2020 04:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E168116C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602644330;
	bh=OPbWaB3j0W8Z6EWJQjN0v2sCW7DPLh4g6lc3DwAwiZw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bbF03V1OGhuMJqohHtVH3w8Nu1o0xtPOCWM/9M6M+q36zBwmDZxlUINIateiowf84
	 7ncXQqHz7/grwylN0XqARdWtuqtp/enEsywZdAnbROF5ZRqV2CpEenQT59rXHBRV6u
	 oJedgxxXApqhq0hWNpbMHSeVfNjmbTwckrnz0sUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07758F80269;
	Wed, 14 Oct 2020 04:57:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83DC4F80225; Wed, 14 Oct 2020 04:57:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C3DBF80118;
 Wed, 14 Oct 2020 04:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C3DBF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="dIkH3k8y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Y4PZ2VTmQ8zBR48egbxk77NAAyz4jeh+ZC7YAyDEI/M=; b=dIkH3k8yxdoWT+xpUe+4g+BxWZ
 3EOwXsKPper3YKayL/jjbVFPf8Xa9C2XlXDIvY0sGaZRkvCwbwGzt+HaHDpek9WsJuSEmdputcyIW
 G86/EUQ8tvfv6VySqTR+9iCIZJh8L+vwUmay8HS2zdIIigb4i4qiFHkf2/c9QK/LM5MKLmrEAwKl6
 BTWWe3oBlNLDhLoNoIfoqXN2Vm5M76wiK6mS0rQ2mlwWhvjURCGPZCHxUDwc/FN/awi2oHgrJl75C
 xpVinvdPtVJ+szGqGZAtyeCQEBbKyDlU5Ff4ToXdaXXUhHiynfSBW5vUuN8lk/FeBf0xDjDNRvYTc
 vQ4T0sww==;
Received: from [2601:1c0:6280:3f0::507c] (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSWxz-0005zg-BG; Wed, 14 Oct 2020 02:56:39 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ASoC: sof: cleanup Kconfig files
Date: Tue, 13 Oct 2020 19:56:30 -0700
Message-Id: <20201014025633.4879-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>
Cc: sound-open-firmware@alsa-project.org
Cc: alsa-devel@alsa-project.org

Some general editing of sound/soc/sof/ Kconfig files:

 [PATCH 1/3] ASoC: sof: imx: fix Kconfig punctuation
 [PATCH 2/3] ASoC: sof: intel: fix Kconfig punctuation and wording
 [PATCH 3/3] ASoC: sof: Kconfig: fix Kconfig punctuation and wording

 sound/soc/sof/Kconfig       |   42 +++++++++++------------
 sound/soc/sof/imx/Kconfig   |   10 ++---
 sound/soc/sof/intel/Kconfig |   62 +++++++++++++++++-----------------
 3 files changed, 57 insertions(+), 57 deletions(-)
