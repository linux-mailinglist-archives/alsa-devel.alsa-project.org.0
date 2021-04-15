Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D14236019A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 07:28:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2938166E;
	Thu, 15 Apr 2021 07:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2938166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618464532;
	bh=E0NXjV1QcWnB0nzyM6JheEd3n+XzG7vZ705oJrc23IA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QbBSg+BsCuWHetWdvrREhsCyiIucVvrrlnOJJoCvwIsTJaLcaKb6nvpuyehWN29bp
	 7nROltdXkztsS06p7M7KyV198MEv43009msm6htzdr2JcAFz+s4LCLblXYrug0r3Zy
	 Cr3fkP3ggO0EuBFSg2qIXCQ+c54tzNO3Cd7wtW48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34634F8022D;
	Thu, 15 Apr 2021 07:27:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36125F800ED; Thu, 15 Apr 2021 07:27:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2E93F800ED
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 07:27:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2E93F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="gs7eGgnM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=FMTd8I8cM7ZBmOYcdPGq5q1CD9LHK5h6uuZ0K6Eod94=; b=gs7eGgnMpOvl7mf1Md8+Hgyu+u
 zr9W8DMqYp0bX7sUfA2mOC5r0JWxkLSSkGLLFzsELCUJrw/Sy5VCu402GbwsSVA1s+G6GqXw/l6MD
 bPXN+rM5fIz8fb9gYZm2mFSHXlJgZCDe27CCACKBAROSr3xUUrdRCKr0S/omkGV7gNFZ61YbksKfh
 g149DSC4YV4TUBEtZSEunvbW4/Dcu8k/DoIbVGQgeruIungJF7d+C9Kwff19mwKeh4IZWp5IYD+Wt
 /pKbSICrXfRHe4rtHeX0qynsueOPE3/yfVkKWCrCKrJj2G9ZBNaW3A0Qba7bp/BwD7XVhK9UaF0IO
 UnIN2Vxg==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lWuWi-00Eu5H-3E; Thu, 15 Apr 2021 05:26:54 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] sound: virtio: correct the function name in kernel-doc comment
Date: Wed, 14 Apr 2021 22:26:45 -0700
Message-Id: <20210415052645.14465-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 virtualization@lists.linux-foundation.org,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

Fix kernel-doc warning that the wrong function name is used in a
kernel-doc comment:

../sound/virtio/virtio_ctl_msg.c:70: warning: expecting prototype for virtsnd_ctl_msg_request(). Prototype was for virtsnd_ctl_msg_response() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Cc: alsa-devel@alsa-project.org
---
 sound/virtio/virtio_ctl_msg.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210414.orig/sound/virtio/virtio_ctl_msg.c
+++ linux-next-20210414/sound/virtio/virtio_ctl_msg.c
@@ -61,7 +61,7 @@ void *virtsnd_ctl_msg_request(struct vir
 }
 
 /**
- * virtsnd_ctl_msg_request() - Get a pointer to the response header.
+ * virtsnd_ctl_msg_response() - Get a pointer to the response header.
  * @msg: Control message.
  *
  * Context: Any context.
