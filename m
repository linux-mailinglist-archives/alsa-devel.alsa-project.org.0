Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B9B2E0C44
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Dec 2020 15:59:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 157BD170B;
	Tue, 22 Dec 2020 15:58:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 157BD170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608649174;
	bh=O1VKuNH5tt3GCChsj8eBSgPp2xN316QTZZ5DhPWUSeQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xz9YyvTVc/T309TLtJu1y2+VD4CnPtIwiQ8xyfaYwZKnw9pndMRAYP5FJ6WZynV7v
	 tUEom3YG4n8igSL9c/Y5/xMAySnvh0jAOaiWz9nT+j6XudbrNI0CJ5h+RbBv515PNF
	 rAx2KAj5CtuF3LhX2dKjPxX59Mju55xElnn7Hzlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60EC1F800BC;
	Tue, 22 Dec 2020 15:57:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DA49F80224; Tue, 22 Dec 2020 15:57:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 029CEF80161
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 15:57:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 029CEF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="FsHK9aiM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:
 From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iTGdLFgQUe+tta1AeuDCXtw2qNDsHjhVSsPkai01ooE=; b=F
 sHK9aiMngsEN9cNBwGmBQ9TAbyWyAcX8Y09zOwEiFh84gMkDMAr85vN1l5ESPupxUpHdlMVZvx8NN
 4ECRJvkcdtAZU8vlarrq+mzIXiv2kLZN/qpZTdHk5OKYvaqZX0haToEqi1Zep8amThnjjtlOWdH15
 IVD8bFvIq7af/dc0zEhUeJteHPeAAfLqL6Xg76jpGLkB+Pjvb5u3PNpV+/Ejjn8TK+xlXzNYArPFp
 /WJxT5Mhc/a3s1b6/FbEmaPrq8ElvpFce5oDBO2VUUI6oC0bvNgbUrHvMixYXzAc3s00tFl9LiYYf
 9SCF1ATymvoK7Vk6Z+Ivo2yHX/XUO6JBg==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=localhost.localdomain)
 by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1krj6h-00FQMk-Sp; Tue, 22 Dec 2020 15:57:47 +0100
From: David Henningsson <coding@diwic.se>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH 0/2] Publish snd_pcm_audio_tstamp_type_t constants
Date: Tue, 22 Dec 2020 15:57:26 +0100
Message-Id: <20201222145728.9368-1-coding@diwic.se>
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

Hi,

Sorry if this message reaches you twice. Apparently I tried to send
this earlier from an address which I no longer has access to. :-(
So if you sent a reply I could never read it.

Hopefully it'll work better this time around.

Anyhow, testing of these patches are limited to running "gitcompile",
which does not seem to compile the tests, is there an easy command to
compile them as well?

David Henningsson (2):
  pcm: Add snd_pcm_audio_tstamp_type_t constants
  test/audio_time: Make use of SND_PCM_AUDIO_TSTAMP_TYPE constants

 include/pcm.h     | 14 ++++++++++++++
 test/audio_time.c | 26 +++++++++++++-------------
 2 files changed, 27 insertions(+), 13 deletions(-)

-- 
2.25.1

