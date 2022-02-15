Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D42E64B6190
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 04:20:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B2DE17F7;
	Tue, 15 Feb 2022 04:19:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B2DE17F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644895246;
	bh=55xmjy3ByWPhtwy23rhk7SgU6xwVH8GnhsIKHiHgIyU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jVpXEZ2OzwXYepO0K4rQmr2IDYxIIgBD6fIHeMYuJhe2wMR81RXlKeYMXd2hjUiOd
	 bLn7QEI/WFEiKW7FYwGgbscjEIcpF6keDIkp36IZD0QSv/XgXr0Y/va2gG0OSBnIyS
	 vR/FH/H9xhiBfyIrA2cDKVDCxRpzW02YYG7/iq5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEB92F800C0;
	Tue, 15 Feb 2022 04:19:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56552F80132; Tue, 15 Feb 2022 04:19:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FA50F800D8
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 04:19:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FA50F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="p5aq//vo"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21F2TqXs014923; 
 Tue, 15 Feb 2022 03:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=FshK+SY46LCCks86OhomWMc97OEykwuZ1jfaUJeYJCo=;
 b=p5aq//voQuFsznU3EwJLBgz7gtLt5AjbETpNRfaIw7zZ2tdhVrs7POydyY9S+R3A0pKH
 DEkFHuEGY4anG+9VMi7gCkjpZQy1l5sQo02lzku/22uZcePrmd8bHu52+jQYLCPtlIrW
 LLw5fMkc7ag4PVnKuyK0wy543JPcclS97j3xQdGajzts6xd/UD3jrnfzs0ccOk06wSFA
 PQA+U1OKfcYnd6Q81Kiyfm6P48tRpxqNfuKzdcGra3e1lqZUcQ/72x3eh+AxBC5b9Vbm
 iXk9hvX9fdbGlHD4u+uYY6n09S+/2NF14j4SUvy/fRLu8unWvDnwV+c3gr+Y9KNllaWa uQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e64gt6e8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 03:19:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21F3HGGH058567;
 Tue, 15 Feb 2022 03:19:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 3e620wpgs6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 03:19:29 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 21F3JMPA064243;
 Tue, 15 Feb 2022 03:19:28 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
 by userp3030.oracle.com with ESMTP id 3e620wpgqq-5;
 Tue, 15 Feb 2022 03:19:28 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH 0/9] use GFP_KERNEL
Date: Mon, 14 Feb 2022 22:19:17 -0500
Message-Id: <164489513314.15031.15565838256267303879.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220210204223.104181-1-Julia.Lawall@inria.fr>
References: <20220210204223.104181-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nDoBGwfRKH754qY0VCkX57qyJcN4xiU4
X-Proofpoint-ORIG-GUID: nDoBGwfRKH754qY0VCkX57qyJcN4xiU4
Cc: alsa-devel@alsa-project.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
 "Martin K . Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 linux-media@vger.kernel.org
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

On Thu, 10 Feb 2022 21:42:14 +0100, Julia Lawall wrote:

> Platform_driver and pci_driver probe functions aren't called with
> locks held and thus don't need GFP_ATOMIC. Use GFP_KERNEL instead.
> 
> All changes have been compile-tested.
> 

Applied to 5.18/scsi-queue, thanks!

[8/9] mptfusion: use GFP_KERNEL
      https://git.kernel.org/mkp/scsi/c/f69b0791df1d

-- 
Martin K. Petersen	Oracle Linux Engineering
