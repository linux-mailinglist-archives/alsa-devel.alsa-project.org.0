Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAC13EDA8D
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 18:08:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E739216B5;
	Mon, 16 Aug 2021 18:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E739216B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629130114;
	bh=mEKnC2Nz/2iVluHF78TpF+3H5JmAlHswK8HO6PhUpFI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L5x5KEv9FkWBIBtOuKp7ufHHavYXuy0F2Ze29ZcAbvKFVtG8kVifUboR3Gb1RsHY9
	 yQ8i99HkPfEjcTuerDmV3EHV21GeMDnkrPmyoYBtUE99Grr4cVbJ/qAmKjVGuPDSBY
	 vb8DB7u2EUfXOCYGDs0uy+fxsCZb1i6cIdsKOmDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A78AF802BE;
	Mon, 16 Aug 2021 18:07:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E23E1F8028D; Mon, 16 Aug 2021 18:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58D96F800AF
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 18:06:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58D96F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="h/awexmN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:
 From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ROB3ZKTXF964yivwQ+h+oKLCMGkU/2DGLtyDZ9pRQZ0=; b=h
 /awexmNnMpDBQV08tDH4fgqU+9NrobUsEql4CMIa2AWkaYRGumONEh0m7WbhZkhXFJJFUr+dCfPcl
 NKHv+h5kOoh+3e26kxhfnhC9LtNA0t6ZHRcfdYopkJ0wea3CRP211CsZwOEmphJSuLuhjDGysaLAJ
 4uEjtH0uReB9no3gV0JQ+7kd2jV/+AswvmfJhu5IXLQEGEP0v6AWAMvXb2sqtSPFQPqbr3AXQ3i1F
 6R2hcCSgfQYLW13TTO1ygzBgKiU5h5P8jJ61x1Fp9IbzPbgspmb3EERF9vVz+r3s54WyxbrFLHkH2
 yPWI7Bt+T8lDss3ASw4Uucr4daCExmlOA==;
Received: from c83-254-143-147.bredband.tele2.se ([83.254.143.147]
 helo=localhost.localdomain)
 by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <coding@diwic.se>)
 id 1mFf8S-0044Nq-I6; Mon, 16 Aug 2021 18:06:48 +0200
From: David Henningsson <coding@diwic.se>
To: tiwai@suse.de,
	perex@perex.cz,
	alsa-devel@alsa-project.org
Subject: [PATCH 0/2] alsa-lib patches for rawmidi tstamp framing
Date: Mon, 16 Aug 2021 18:06:23 +0200
Message-Id: <20210816160625.17796-1-coding@diwic.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: coding@diwic.se
Cc: David Henningsson <coding@diwic.se>
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

Well, now that we're about to release a kernel with support for rawmidi tstamp framing,
how about some alsa-lib support for it as well?

David Henningsson (2):
  Add rawmidi framing API
  Add test for rawmidi framing API

 include/rawmidi.h           | 26 ++++++++++++
 include/sound/uapi/asound.h | 30 +++++++++++++-
 src/rawmidi/rawmidi.c       | 83 +++++++++++++++++++++++++++++++++++++
 src/rawmidi/rawmidi_hw.c    |  2 +
 src/rawmidi/rawmidi_local.h |  2 +
 test/rawmidi.c              | 65 ++++++++++++++++++++++++++---
 6 files changed, 200 insertions(+), 8 deletions(-)

-- 
2.25.1

