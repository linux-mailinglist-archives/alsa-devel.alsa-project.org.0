Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D152712FBF7
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 19:00:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32BA8177F;
	Fri,  3 Jan 2020 18:59:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32BA8177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578074437;
	bh=Z6+uXN+p63Bi5bhFzHZo92FaPcnvVj6pv+4GCrqOrm8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y7OiiRDBxJaojDVuyMpPLCTKMhePPD52RYuqS6iw0u7geq4q/B55MGG26GFVqc552
	 D2fbBts+ATkqX7r7yu7jsg9eHqdelFjt5maBbVWqL/Iwu/hLRnqi3l32sFaWPhx2Ta
	 /2Zv4cc15XWgS2e/6AAETLph17wnkzEihD2neC6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 544BAF80278;
	Fri,  3 Jan 2020 18:56:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37D57F80271; Fri,  3 Jan 2020 18:56:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED, UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from llmx2.ll.mit.edu (llmx2.ll.mit.edu [129.55.12.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 963F6F8015E
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 18:56:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 963F6F8015E
Received: from LLE2K16-MBX01.mitll.ad.local (LLE2K16-MBX01.mitll.ad.local) by
 llmx2.ll.mit.edu (unknown) with ESMTPS id 003HuHob024908;
 Fri, 3 Jan 2020 12:56:17 -0500
From: David Ward <david.ward@ll.mit.edu>
To: Takashi Iwai <tiwai@suse.de>, <alsa-devel@alsa-project.org>
Date: Fri, 3 Jan 2020 12:55:51 -0500
Message-ID: <1578074158-30328-5-git-send-email-david.ward@ll.mit.edu>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578074158-30328-1-git-send-email-david.ward@ll.mit.edu>
References: <1578074158-30328-1-git-send-email-david.ward@ll.mit.edu>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2020-01-03_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=982
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001030164
Cc: David Ward <david.ward@ll.mit.edu>
Subject: [alsa-devel] [PATCH v2 alsa-utils 04/11] alsa-info.sh: Use existing
	function to print ALSA configuration files
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

Signed-off-by: David Ward <david.ward@ll.mit.edu>
---
 alsa-info/alsa-info.sh | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/alsa-info/alsa-info.sh b/alsa-info/alsa-info.sh
index ff3cf95..a1c1449 100755
--- a/alsa-info/alsa-info.sh
+++ b/alsa-info/alsa-info.sh
@@ -708,33 +708,8 @@ if [ -n "$1" ]; then
 			WITHALL="no"
 			;;
 		--with-configs)
+			withconfigs
 			WITHALL="no"
-			if [[ -e $HOME/.asoundrc ]] || [[ -e /etc/asound.conf ]]
-			then
-				echo "!!ALSA configuration files" >> $FILE
-				echo "!!------------------------" >> $FILE
-				echo "" >> $FILE
-
-				#Check for ~/.asoundrc
-				if [[ -e $HOME/.asoundrc ]]
-				then
-					echo "!!User specific config file ($HOME/.asoundrc)" >> $FILE
-					echo "" >> $FILE
-					cat $HOME/.asoundrc >> $FILE
-					echo "" >> $FILE
-					echo "" >> $FILE
-				fi
-
-				#Check for /etc/asound.conf
-				if [[ -e /etc/asound.conf ]]
-				then
-					echo "!!System wide config file (/etc/asound.conf)" >> $FILE
-					echo "" >> $FILE
-					cat /etc/asound.conf >> $FILE
-					echo "" >> $FILE
-					echo "" >> $FILE
-				fi
-			fi
 			;;
 		--stdout)
 			UPLOAD="no"
-- 
1.8.3.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
