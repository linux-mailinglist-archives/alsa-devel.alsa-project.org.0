Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 168C919ED5E
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Apr 2020 20:37:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 728341683;
	Sun,  5 Apr 2020 20:36:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 728341683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586111858;
	bh=j61JYqZLvrhLMRmq0tZN/b2WXUyHXc4BAuYjSYtnjKs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lJyi7VogSWIcooWOjoz2N++9XQwAFS4vv04GFqGI2AtdRN+xmWfAeJnHQ5Gc0OA9V
	 /bCix2IwwVsZFQvwCrsrnuSWdnYqDRMpGsPsviZdD1XzsVBFluv7yLEeTaCcZN7SYM
	 q42Jp7LWn4AOI6koXCgPHTM2oKMGpX9W+Z/JD5jg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10F85F80213;
	Sun,  5 Apr 2020 20:35:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51F65F8015A; Sun,  5 Apr 2020 20:35:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D787F80121
 for <alsa-devel@alsa-project.org>; Sun,  5 Apr 2020 20:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D787F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Dxkw6AUy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586111701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j61JYqZLvrhLMRmq0tZN/b2WXUyHXc4BAuYjSYtnjKs=;
 b=Dxkw6AUyCHKY1V7+TNlyGPbWyELbr5tERCQ4CiVzmPYbff956Sd8UFCJ+1kDfgbLyTh3Gt
 4zZ+HDESGacQwcMjM68KLwzL6cKqCRofmRPLygw17jgPZgUNLpiDwtFGv8WYZbWMehK6w4
 COwveA6jWvlWSjtpyflPlp/Gr4gYugk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-2wq22LkCOKS6XbRln5ykxw-1; Sun, 05 Apr 2020 14:35:00 -0400
X-MC-Unique: 2wq22LkCOKS6XbRln5ykxw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BB4B800D53;
 Sun,  5 Apr 2020 18:34:59 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-60.ams2.redhat.com [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E0309A24B;
 Sun,  5 Apr 2020 18:34:58 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/5] chtrt5645: Add ASUSTeKCOMPUTERINC.-T100HAN-1.0 symlink to
 chtrt5645-dmic1.conf
Date: Sun,  5 Apr 2020 20:34:51 +0200
Message-Id: <20200405183454.34515-2-hdegoede@redhat.com>
In-Reply-To: <20200405183454.34515-1-hdegoede@redhat.com>
References: <20200405183454.34515-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

We already have a ASUSTeKCOMPUTERINC.-T100HAN-1.0-T100HAN symlink to
chtrt5645-dmic1.conf, but since kernel commit 39870b0dec68 ("ASoC: DMI long
name - avoid to add board name if matches with product name"), the kernel
omits the (second) -T100HAN. So with newer kernels that no longer works.

Arguably this is a kernel regressions, but chances are we already have
some configs depending on the new behavior, so lets fix this on the
UCM2 side by adding a second symlink using the new long name.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/chtrt5645/ASUSTeKCOMPUTERINC.-T100HAN-1.0.conf | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 ucm2/chtrt5645/ASUSTeKCOMPUTERINC.-T100HAN-1.0.conf

diff --git a/ucm2/chtrt5645/ASUSTeKCOMPUTERINC.-T100HAN-1.0.conf b/ucm2/cht=
rt5645/ASUSTeKCOMPUTERINC.-T100HAN-1.0.conf
new file mode 120000
index 0000000..b4d2816
--- /dev/null
+++ b/ucm2/chtrt5645/ASUSTeKCOMPUTERINC.-T100HAN-1.0.conf
@@ -0,0 +1 @@
+chtrt5645-dmic1.conf
\ No newline at end of file
--=20
2.26.0

