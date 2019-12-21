Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6681A12878C
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Dec 2019 06:34:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D47E1655;
	Sat, 21 Dec 2019 06:33:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D47E1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576906451;
	bh=cwGmEnkkZ6DtIFPnkgC0AWf960+iS8FidSnwAvW1UjQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BgCA7QQSrKvGN5K4euIK1nT/WdLnQ+Alq9ujY6TQWnG3QNtiwU0zsLbsyFBAZhGiY
	 JHVbheSNUr9kPTQo5yM2aiNcPn23HdJ8dOCaH26j+KuEIJ7yiiX46pBm29iEJngwSN
	 /L8ct6cQuWH2iIkuDpJlfxSR9iAbEC4879ur9YRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09EFFF80256;
	Sat, 21 Dec 2019 06:32:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A3F9F80253; Sat, 21 Dec 2019 06:32:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from llmx2.ll.mit.edu (llmx2.ll.mit.edu [129.55.12.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53D80F800E0
 for <alsa-devel@alsa-project.org>; Sat, 21 Dec 2019 06:32:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53D80F800E0
Received: from LLE2K16-MBX03.mitll.ad.local (LLE2K16-MBX03.mitll.ad.local) by
 llmx2.ll.mit.edu (unknown) with ESMTPS id xBL5WHCC023796 for
 <alsa-devel@alsa-project.org>; Sat, 21 Dec 2019 00:32:17 -0500
From: David Ward <david.ward@ll.mit.edu>
To: <alsa-devel@alsa-project.org>
Date: Sat, 21 Dec 2019 00:32:00 -0500
Message-ID: <1576906331-5212-1-git-send-email-david.ward@ll.mit.edu>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-12-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=726
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912210045
Cc: David Ward <david.ward@ll.mit.edu>
Subject: [alsa-devel] [PATCH alsa-utils 00/11] alsa-info.sh: Improve output
	and fix file upload issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

David Ward (11):
  alsa-info.sh: Consolidate PCI device output
  alsa-info.sh: Read from /proc/modules and sort the result
  alsa-info.sh: Simplify iteration over cards when calling amixer
  alsa-info.sh: Use existing function to print ALSA configuration files
  alsa-info.sh: Exit script after writing information to stdout
  alsa-info.sh: Replace gauge with infobox for upload dialog
  alsa-info.sh: Remove progress spinner during upload without dialog
  alsa-info.sh: Condense nested commands for file upload
  alsa-info.sh: Condense nested commands for formatting upload result
  alsa-info.sh: Perform test for wget earlier
  alsa-info.sh: Warn after actual upload failure; do not ping server

 alsa-info/alsa-info.sh | 251 ++++++++++++++++++-------------------------------
 1 file changed, 90 insertions(+), 161 deletions(-)

-- 
1.8.3.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
