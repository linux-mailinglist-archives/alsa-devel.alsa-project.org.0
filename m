Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD66112FC04
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 19:01:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DB0B1799;
	Fri,  3 Jan 2020 19:00:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DB0B1799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578074479;
	bh=KBKwpWtW6cBCRODHbfjCpZRkZ/B0BUWQo2soKTrh6mo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SFsz7OQJU+JHCw/X+MY/B7bvOdX65fDsrTQSyYLxGginu89ZaC68jvIYJoxDNTaOS
	 AtkvaPQADxrHT14+5XKm36xadJ2YSU9/wxsYA7mf8Jwez5uqUHcOYuCi9+hXsy8AtQ
	 SZndFxdTKWW8n2AuM7NDhZn8fK35B/juxmxX8qZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98B93F80292;
	Fri,  3 Jan 2020 18:56:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 096F2F80274; Fri,  3 Jan 2020 18:56:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED, UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from llmx3.ll.mit.edu (llmx3.ll.mit.edu [129.55.12.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA4CDF8015C
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 18:56:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA4CDF8015C
Received: from LLE2K16-MBX01.mitll.ad.local (LLE2K16-MBX01.mitll.ad.local) by
 llmx3.ll.mit.edu (unknown) with ESMTPS id 003HuJHL011845;
 Fri, 3 Jan 2020 12:56:19 -0500
From: David Ward <david.ward@ll.mit.edu>
To: Takashi Iwai <tiwai@suse.de>, <alsa-devel@alsa-project.org>
Date: Fri, 3 Jan 2020 12:55:52 -0500
Message-ID: <1578074158-30328-6-git-send-email-david.ward@ll.mit.edu>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578074158-30328-1-git-send-email-david.ward@ll.mit.edu>
References: <1578074158-30328-1-git-send-email-david.ward@ll.mit.edu>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2020-01-03_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001030164
Cc: David Ward <david.ward@ll.mit.edu>
Subject: [alsa-devel] [PATCH v2 alsa-utils 05/11] alsa-info.sh: Exit script
	after writing information to stdout
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

The '--stdout' option is mutually exclusive with uploading the file.

Signed-off-by: David Ward <david.ward@ll.mit.edu>
---
 alsa-info/alsa-info.sh | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/alsa-info/alsa-info.sh b/alsa-info/alsa-info.sh
index a1c1449..cc058f7 100755
--- a/alsa-info/alsa-info.sh
+++ b/alsa-info/alsa-info.sh
@@ -349,9 +349,7 @@ case "$1" in
 		;;
 	--stdout)
 		DIALOG=""
-		UPLOAD="no"
 		WELCOME="no"
-		TOSTDOUT="yes"
 		;;
 esac
 done
@@ -718,6 +716,7 @@ if [ -n "$1" ]; then
 			fi
 			cat $FILE
 			rm $FILE
+			exit
 			;;
 		--about)
 			echo "Written/Tested by the following users of #alsa on irc.freenode.net:"
@@ -791,10 +790,8 @@ fi
 
 if [ "$UPLOAD" = "no" ]; then
 
-	if [ -z "$TOSTDOUT" ]; then
-		mv -f $FILE $NFILE || exit 1
-		KEEP_OUTPUT="yes"
-	fi
+	mv -f $FILE $NFILE || exit 1
+	KEEP_OUTPUT="yes"
 
 	if [[ -n $DIALOG ]]
 	then
@@ -813,11 +810,9 @@ if [ "$UPLOAD" = "no" ]; then
 			echo "Your ALSA information is in $NFILE"
 			echo ""
 		else
-			if [ -z "$TOSTDOUT" ]; then
-				echo ""
-				echo "Your ALSA information is in $NFILE"
-				echo ""
-			fi
+			echo ""
+			echo "Your ALSA information is in $NFILE"
+			echo ""
 		fi
 	fi
 
-- 
1.8.3.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
