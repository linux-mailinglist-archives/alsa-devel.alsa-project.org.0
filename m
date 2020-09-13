Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BE6268056
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Sep 2020 18:54:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04BD71686;
	Sun, 13 Sep 2020 18:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04BD71686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600016069;
	bh=4CHzWqSVS570ze2/4WyDzefRZ66MvdpIBvbqiOTEMi8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JEIrPayq+pfplVxSlpq5GdUASkYeYPYXFPHrNmEeEEa8AvTV2Euyh4lV2GyosWXfv
	 7sZc6q4AuldTLf0cWwcnoQ+2muJHvTEYSeMOx5KwyMQ/YeIFF8C5+Disq1ta5ZXNXg
	 QQLbyLqccwJl+mZgydXBYu6otWe0JmdBEcbnZV3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08F27F80276;
	Sun, 13 Sep 2020 18:52:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 298DBF8025E; Sun, 13 Sep 2020 18:52:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 029D0F800AA
 for <alsa-devel@alsa-project.org>; Sun, 13 Sep 2020 18:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 029D0F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="aTEMDv5N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600015958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=OnOecvlCsmh6JKu+PCBfRD+F9XU63TdFztNbTAcxKzQ=;
 b=aTEMDv5NTsJaG4DOVSa3fa0wavAPywOIIL82OxPVEAYt7dgttI8VKgP+8quktWbeiKSiGz
 D5VQ4Vin8QAtoERoGbHyFcv4xyyMcRZP4TrtDJLIFnsplISe5jAeDIPQ1kONbU5hxrFHhj
 CfhgAGOfUDlhISTbggo0s8GibalRTnI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-7Q2lTRtzM2-Aq1Qi4ZzHTQ-1; Sun, 13 Sep 2020 12:52:36 -0400
X-MC-Unique: 7Q2lTRtzM2-Aq1Qi4ZzHTQ-1
Received: by mail-qt1-f199.google.com with SMTP id z27so10354983qtu.3
 for <alsa-devel@alsa-project.org>; Sun, 13 Sep 2020 09:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OnOecvlCsmh6JKu+PCBfRD+F9XU63TdFztNbTAcxKzQ=;
 b=uL/QnhzhWVxZkPFGaAsTjGNyU2pvFqUwkQhizQk0k85aQXC7a9lfdLvdtDmputMqQy
 xFLzNBH2Vg6ftufIfyyJ5JF0YWskcdSF+KrBJWKLpRoDDF0/j01PL5JQpt5Y04XtwtkU
 Q3CcAMain/tNYzmicns3lMA39kgwc0QIJPLzkstOLsjTKshqaQ6mZMVwN3L+7NpLm5cA
 bUj8AKouI0AaM7v01RieYhciKSH1B0oFcnJN+M26511LNh0cWIgQWiUDqKXSeC5ZXfIp
 kFj3nb6MVnN9QufVliMq2kLM9fLA8WSNSKWcIcRMCVPg04QhBMiTCLPqLVxhYJShomhc
 4lCw==
X-Gm-Message-State: AOAM532O9K23+ktgK9eGuexTwbggwj258+WR/YTz038UzhhjtLckZ/vb
 FfWwJZXPO6Ky0zUsg1+W6QL0HtnMYSKMZNFK4U3WfRxh2KAgb5Dtzkqa/nYOjRMlC2EMIC+BoLd
 Q/G6TQTQRvSLu+qiEPVB6baA=
X-Received: by 2002:ac8:100c:: with SMTP id z12mr9721968qti.81.1600015956040; 
 Sun, 13 Sep 2020 09:52:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKjF1J+GeKF9ZXkHPfeiFmrEfSqgpwFwO2TqwgCrLbYQUDsHZHFMMJdU6H5SApjSbMKUclEA==
X-Received: by 2002:ac8:100c:: with SMTP id z12mr9721935qti.81.1600015955583; 
 Sun, 13 Sep 2020 09:52:35 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id g19sm11332392qka.84.2020.09.13.09.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 09:52:35 -0700 (PDT)
From: trix@redhat.com
To: perex@perex.cz, tiwai@suse.com, natechancellor@gmail.com,
 ndesaulniers@google.com, eblennerhassett@audioscience.com
Subject: [PATCH] ALSA: asihpi: fix iounmap in error handler
Date: Sun, 13 Sep 2020 09:52:30 -0700
Message-Id: <20200913165230.17166-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Cc: clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
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

From: Tom Rix <trix@redhat.com>

clang static analysis flags this problem
hpioctl.c:513:7: warning: Branch condition evaluates to
  a garbage value
                if (pci.ap_mem_base[idx]) {
                    ^~~~~~~~~~~~~~~~~~~~

If there is a failure in the middle of the memory space loop,
only some of the memory spaces need to be cleaned up.

At the error handler, idx holds the number of successful
memory spaces mapped.  So rework the handler loop to use the
old idx.

There is a second problem, the memory space loop conditionally
iomaps()/sets the mem_base so it is necessay to initize pci.

Fixes: 719f82d3987a ("ALSA: Add support of AudioScience ASI boards")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/pci/asihpi/hpioctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/asihpi/hpioctl.c b/sound/pci/asihpi/hpioctl.c
index 6cc2b6964bb5..bb31b7fe867d 100644
--- a/sound/pci/asihpi/hpioctl.c
+++ b/sound/pci/asihpi/hpioctl.c
@@ -352,7 +352,7 @@ int asihpi_adapter_probe(struct pci_dev *pci_dev,
 	struct hpi_message hm;
 	struct hpi_response hr;
 	struct hpi_adapter adapter;
-	struct hpi_pci pci;
+	struct hpi_pci pci = { 0 };
 
 	memset(&adapter, 0, sizeof(adapter));
 
@@ -509,7 +509,7 @@ int asihpi_adapter_probe(struct pci_dev *pci_dev,
 	return 0;
 
 err:
-	for (idx = 0; idx < HPI_MAX_ADAPTER_MEM_SPACES; idx++) {
+	while (--idx >= 0) {
 		if (pci.ap_mem_base[idx]) {
 			iounmap(pci.ap_mem_base[idx]);
 			pci.ap_mem_base[idx] = NULL;
-- 
2.18.1

