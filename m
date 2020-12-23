Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 475462E1FF6
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 18:27:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC1F9179D;
	Wed, 23 Dec 2020 18:26:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC1F9179D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608744447;
	bh=MXsG7Q3BwM7UmoE6V780l3f6ryR7cmLdrOiB5/Es1aE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pD/r0AcO5Rs8W5s11G/JuIlBreRGdCkH5U6ijPykatylLiU+5p1hchYQq9sAUnKbG
	 8+SuwpcDMADO8Wq5g+G9PQEJYHgOiXfv/D/1/eawei0CNSWYgBXwu1po82MZoCdHoL
	 XpsYOxFipNMvF4+WA4qLo0yEocPcCwt0aGJuyRJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E101F804ED;
	Wed, 23 Dec 2020 18:23:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C43D4F804C3; Wed, 23 Dec 2020 18:23:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE6AFF8027D
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 18:23:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE6AFF8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="VcMtc3v8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=Qih6Acpb9w4ikOh/x6soFx60kNwlnscMxJPMPsz4ZGw=; b=VcMtc3v8ba5+VnJPNEQAskuScm
 5doHcB4fmPGgll68LNWI3au8oPY0oaOybJDWQLn5AX25kAXbzjTsDst9qKa0GdGYS0MCPh+oweHZh
 bsmvu31LNiZBg6sW8/OtG8OeDjxtwdVE/FowCLPlQeAOz2SWJFcrLs/88e+PhHwbl9qQ5s/ulplsl
 Fq2juUis0kIuUbZMV2og1H8WiJlVLfYPBZz5LAITE4IV+hxDsOoQnlz8A7k2CyK3I9A2qgvZyhTnz
 8GUrLlY6wqloia+yFj21e+TGpWZ6b1J7VIGSCVuAio6GE0W3I+QAD5qDiaJPvNVopQdSwzubcZJdw
 cZCFtqGw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1ks7qt-000EuA-Ix; Wed, 23 Dec 2020 18:23:07 +0100
Received: from [62.216.202.54] (helo=lars-desktop.fritz.box)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1ks7qo-000Crk-ER; Wed, 23 Dec 2020 18:23:02 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 08/18] ALSA: emu10k1: Use DIV_ROUND_UP() instead of
 open-coding it
Date: Wed, 23 Dec 2020 18:22:19 +0100
Message-Id: <20201223172229.781-8-lars@metafoo.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201223172229.781-1-lars@metafoo.de>
References: <20201223172229.781-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26026/Wed Dec 23 13:53:03 2020)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>
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

Use DIV_ROUND_UP() instead of open-coding it. This documents intent
and makes it more clear what is going on for the casual reviewer.

Generated using the following the Coccinelle semantic patch.

// <smpl>
@@
expression x, y;
@@
-(((x) + (y) - 1) / (y))
+DIV_ROUND_UP(x, y)
// </smpl>

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 sound/pci/emu10k1/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/memory.c b/sound/pci/emu10k1/memory.c
index 94b8d5b08225..288e0fd2e47d 100644
--- a/sound/pci/emu10k1/memory.c
+++ b/sound/pci/emu10k1/memory.c
@@ -375,7 +375,7 @@ int snd_emu10k1_alloc_pages_maybe_wider(struct snd_emu10k1 *emu, size_t size,
 					struct snd_dma_buffer *dmab)
 {
 	if (emu->iommu_workaround) {
-		size_t npages = (size + PAGE_SIZE - 1) / PAGE_SIZE;
+		size_t npages = DIV_ROUND_UP(size, PAGE_SIZE);
 		size_t size_real = npages * PAGE_SIZE;
 
 		/*
-- 
2.20.1

