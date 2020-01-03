Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6F312FC05
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 19:01:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 601A81783;
	Fri,  3 Jan 2020 19:01:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 601A81783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578074518;
	bh=i1e05410WQZXUXUfnmF43POUQL8SjVxT9UzuJ/nf2kM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IGtj25LnzXK3MRwIGQHDbi0pXYTufLavpvnRWfofegrXQK7LXgOrX1G8UHzjwl+D2
	 JuTDsUbz8ZnNqaRTkQzS41C2ZAPdeUMSaeiOtHhek9voygbdLRd8CIwPB+4yrpmsXL
	 E4kYheYUMrSOL5EwsGZ3Fxdupag5bkZVcH3bN77E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E320F8028D;
	Fri,  3 Jan 2020 18:56:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1103F80278; Fri,  3 Jan 2020 18:56:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED, UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from llmx2.ll.mit.edu (llmx2.ll.mit.edu [129.55.12.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDA9EF8021D
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 18:56:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDA9EF8021D
Received: from LLE2K16-MBX01.mitll.ad.local (LLE2K16-MBX01.mitll.ad.local) by
 llmx2.ll.mit.edu (unknown) with ESMTPS id 003HuKZU024915;
 Fri, 3 Jan 2020 12:56:20 -0500
From: David Ward <david.ward@ll.mit.edu>
To: Takashi Iwai <tiwai@suse.de>, <alsa-devel@alsa-project.org>
Date: Fri, 3 Jan 2020 12:55:53 -0500
Message-ID: <1578074158-30328-7-git-send-email-david.ward@ll.mit.edu>
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
Subject: [alsa-devel] [PATCH v2 alsa-utils 06/11] alsa-info.sh: Replace
	gauge with infobox for upload dialog
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

The gauge did not actually show the upload progress; in fact, the
dialog did not even appear until after the upload was completed.

Use an infobox instead, which will be displayed while wget runs.

Signed-off-by: David Ward <david.ward@ll.mit.edu>
---
 alsa-info/alsa-info.sh | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/alsa-info/alsa-info.sh b/alsa-info/alsa-info.sh
index cc058f7..7204c8e 100755
--- a/alsa-info/alsa-info.sh
+++ b/alsa-info/alsa-info.sh
@@ -828,19 +828,11 @@ if [[ -n $DIALOG ]]
 then
 
 if [[ -z $PASTEBIN ]]; then
+	dialog --backtitle "$BGTITLE" --infobox "Uploading information to www.alsa-project.org ..." 6 70
 	wget -O - --tries=5 --timeout=60 --post-file=$FILE "http://www.alsa-project.org/cardinfo-db/" &>$TEMPDIR/wget.tmp || echo "Upload failed; exit"
-	{ for i in 10 20 30 40 50 60 70 80 90; do
-		echo $i
-		sleep 0.2
-	done
-	echo; } |dialog --backtitle "$BGTITLE" --guage "Uploading information to www.alsa-project.org ..." 6 70 0
 else
+	dialog --backtitle "$BGTITLE" --infobox "Uploading information to www.pastebin.ca ..." 6 70
 	wget -O - --tries=5 --timeout=60 --post-file=$FILE "http://pastebin.ca/quiet-paste.php?api=$PASTEBINKEY&encrypt=t&encryptpw=blahblah" &>$TEMPDIR/wget.tmp || echo "Upload failed; exit"
-	{ for i in 10 20 30 40 50 60 70 80 90; do
-		echo $i
-		sleep 0.2
-	done
-	echo; } |dialog --backtitle "$BGTITLE" --guage "Uploading information to www.pastebin.ca ..." 6 70 0
 fi
 
 dialog --backtitle "$BGTITLE" --title "Information uploaded" --yesno "Would you like to see the uploaded information?" 5 100 
-- 
1.8.3.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
