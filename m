Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B14A3D2146
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 11:52:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AC2C16CF;
	Thu, 22 Jul 2021 11:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AC2C16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626947541;
	bh=5nxov8ciV1tfLgw1o3KidC/AG7DmWvz/Jsf5svr9jzs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nxZpMHzFSNbhp9P3wRz8fRPyhrgKo94EPSc6lD1LuV1aIeNJtnjb7uHTWQSnvqpR8
	 3gpNYwS5v2gih52cb6mF2fK6JGyI0HyhUnDJoYZj6bvqGa2li3qCD78Q7sAmHzzTWv
	 IDhSfhEDyzOLNBo5g6sPmUxCdIX80gp8WhpZ8nHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED43CF8032B;
	Thu, 22 Jul 2021 11:51:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8A88F80227; Thu, 22 Jul 2021 11:51:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB453F80114
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 11:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB453F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Cm8nE1/+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A848861244;
 Thu, 22 Jul 2021 09:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626947415;
 bh=5nxov8ciV1tfLgw1o3KidC/AG7DmWvz/Jsf5svr9jzs=;
 h=From:To:Cc:Subject:Date:From;
 b=Cm8nE1/+TevcInwy+rn1B4+T5kVqAqTToUucYXWnerFGM2OTi+341mhrug0MILyKv
 h8yEojyplk3+LOL4qcHM/GwFDf8ppmWWlQF7mZzjBgqOEj6mgT5gGhmZgeu7itteuq
 STubEdS4MhdXCz+cAhSaz24CStCSAIhZt19+9O6URK/G0M3f5AFv315U4+UH+MlQhM
 ypYq/o2V2cdxN+A2SdQpT04BvjZ66gh+9giRFNmvjBSRdynd68JDSWlsl88Sjw9vGH
 DukwKI3tpCLtxUiEWogBreNm6inVVlYG5nM6GyZqTc9t4eYqIO0eH222FdR+JqMCWq
 +JF3xjLNGUw5Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1m6VLD-008lGb-AO; Thu, 22 Jul 2021 11:50:07 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/3] Get rid of some undesirable characters
Date: Thu, 22 Jul 2021 11:50:00 +0200
Message-Id: <cover.1626947264.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
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

Hi Jon,

While rebasing my docs tree, I noticed that there are three remaining
patches from my past series that replace some UTF-8 chars by ASCII
ones that aren't applied yet. Not sure what happened here.

Anyway, those are the missing ones.

Mauro Carvalho Chehab (3):
  docs: sound: kernel-api: writing-an-alsa-driver.rst: replace some
    characters
  docs: firmware-guide: acpi: dsd: graph.rst: replace some characters
  docs: virt: kvm: api.rst: replace some characters

 .../firmware-guide/acpi/dsd/graph.rst         |  2 +-
 .../kernel-api/writing-an-alsa-driver.rst     |  2 +-
 Documentation/virt/kvm/api.rst                | 28 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.31.1


