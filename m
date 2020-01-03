Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBD312FC0B
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 19:04:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17429179C;
	Fri,  3 Jan 2020 19:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17429179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578074680;
	bh=UlvbZ3aBIrSGtov0xdOJ5AgaX/wkjYRqU4rtl9i2OEo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H4Y+aXuy6gLDQfWQqBLVDhnzXsPdfNLTiYgRgdxUj3OpRdM7tv7p74luaVJQdmekY
	 gD5j6ARgYioJmRL3JDGmsP2XtFNm2OJSP9Mz/V009tG4CkvNFNQk7wqMBAFmwYoujr
	 tA7oRpfJfWo1quw9s+tua+K8ciM3cznaeAJJZZfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E30BCF802E9;
	Fri,  3 Jan 2020 18:56:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1FADF80291; Fri,  3 Jan 2020 18:56:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED, UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from llmx2.ll.mit.edu (llmx2.ll.mit.edu [129.55.12.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 388CEF8015C
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 18:56:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 388CEF8015C
Received: from LLE2K16-MBX01.mitll.ad.local (LLE2K16-MBX01.mitll.ad.local) by
 llmx2.ll.mit.edu (unknown) with ESMTPS id 003HuQhm024936;
 Fri, 3 Jan 2020 12:56:26 -0500
From: David Ward <david.ward@ll.mit.edu>
To: Takashi Iwai <tiwai@suse.de>, <alsa-devel@alsa-project.org>
Date: Fri, 3 Jan 2020 12:55:57 -0500
Message-ID: <1578074158-30328-11-git-send-email-david.ward@ll.mit.edu>
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
Subject: [alsa-devel] [PATCH v2 alsa-utils 10/11] alsa-info.sh: Perform test
	for wget earlier
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

If wget is not present, do not ask about uploading the information.

Signed-off-by: David Ward <david.ward@ll.mit.edu>
---
 alsa-info/alsa-info.sh | 73 ++++++++++++++++++++++++--------------------------
 1 file changed, 35 insertions(+), 38 deletions(-)

diff --git a/alsa-info/alsa-info.sh b/alsa-info/alsa-info.sh
index 1bdb1aa..445e2cb 100755
--- a/alsa-info/alsa-info.sh
+++ b/alsa-info/alsa-info.sh
@@ -767,6 +767,41 @@ if [ -z "$WITHALL" ]; then
 	withall
 fi
 
+# Check if wget is installed, and supports --post-file.
+if ! wget --help 2>/dev/null | grep -q post-file; then
+	# We couldn't find a suitable wget. If --upload was passed, tell the user to upload manually.
+	if [ "$UPLOAD" != "yes" ]; then
+		:
+	elif [ -n "$DIALOG" ]; then
+		if [ -z "$PASTEBIN" ]; then
+			dialog --backtitle "$BGTITLE" --msgbox "Could not automatically upload output to http://www.alsa-project.org.\nPossible reasons are:\n\n    1. Couldn't find 'wget' in your PATH\n    2. Your version of wget is less than 1.8.2\n\nPlease manually upload $NFILE to http://www.alsa-project.org/cardinfo-db/ and submit your post." 25 100
+		else
+			dialog --backtitle "$BGTITLE" --msgbox "Could not automatically upload output to http://www.pastebin.ca.\nPossible reasons are:\n\n    1. Couldn't find 'wget' in your PATH\n    2. Your version of wget is less than 1.8.2\n\nPlease manually upload $NFILE to http://www.pastebin.ca/upload.php and submit your post." 25 100
+		fi
+	else
+		if [ -z "$PASTEBIN" ]; then
+			echo ""
+			echo "Could not automatically upload output to http://www.alsa-project.org"
+			echo "Possible reasons are:"
+			echo "    1. Couldn't find 'wget' in your PATH"
+			echo "    2. Your version of wget is less than 1.8.2"
+			echo ""
+			echo "Please manually upload $NFILE to http://www.alsa-project.org/cardinfo-db/ and submit your post."
+			echo ""
+		else
+			echo ""
+			echo "Could not automatically upload output to http://www.pastebin.ca"
+			echo "Possible reasons are:"
+			echo "    1. Couldn't find 'wget' in your PATH"
+			echo "    2. Your version of wget is less than 1.8.2"
+			echo ""
+			echo "Please manually upload $NFILE to http://www.pastebin.ca/upload.php and submit your post."
+			echo ""
+		fi
+	fi
+	UPLOAD="no"
+fi
+
 if [ "$UPLOAD" = "ask" ]; then
 	if [ -n "$DIALOG" ]; then
 		dialog --backtitle "$BGTITLE" --title "Information collected" --yes-label " UPLOAD / SHARE " --no-label " SAVE LOCALLY " --defaultno --yesno "\n\nAutomatically upload ALSA information to $WWWSERVICE?" 10 80
@@ -820,10 +855,6 @@ if [ "$UPLOAD" = "no" ]; then
 
 fi # UPLOAD
 
-# Test that wget is installed, and supports --post-file. Upload $FILE if it does, and prompt user to upload file if it does not.
-if [[ -n "${WGET}" ]] && [[ -x "${WGET}" ]] && [[ $(wget --help | grep post-file) ]]
-then
-
 if [[ -n $DIALOG ]]
 then
 	dialog --backtitle "$BGTITLE" --infobox "Uploading information to $WWWSERVICE ..." 6 70
@@ -861,37 +892,3 @@ fi
 echo "Your ALSA information is located at $FINAL_URL"
 echo "Please inform the person helping you."
 echo ""
-
-# We couldnt find a suitable wget, so tell the user to upload manually.
-else
-	mv -f $FILE $NFILE || exit 1
-	KEEP_OUTPUT="yes"
-	if [[ -z $DIALOG ]]
-	then
-		if [[ -z $PASTEBIN ]]; then
-		echo ""
-		echo "Could not automatically upload output to http://www.alsa-project.org"
-		echo "Possible reasons are:"
-		echo "    1. Couldnt find 'wget' in your PATH"
-		echo "    2. Your version of wget is less than 1.8.2"
-		echo ""
-		echo "Please manually upload $NFILE to http://www.alsa-project.org/cardinfo-db/ and submit your post."
-		echo ""
-		else
-		echo ""
-		echo "Could not automatically upload output to http://www.pastebin.ca"
-		echo "Possible reasons are:"
-		echo "    1. Couldnt find 'wget' in your PATH"
-		echo "    2. Your version of wget is less than 1.8.2"
-		echo ""
-		echo "Please manually upload $NFILE to http://www.pastebin.ca/upload.php and submit your post."
-		echo ""
-		fi
-	else
-		if [[ -z $PASTEBIN ]]; then
-			dialog --backtitle "$BGTITLE" --msgbox "Could not automatically upload output to http://www.alsa-project.org.\nPossible reasons are:\n\n    1. Couldn't find 'wget' in your PATH\n    2. Your version of wget is less than 1.8.2\n\nPlease manually upload $NFILE to http://www.alsa-project,org/cardinfo-db/ and submit your post." 25 100
-		else
-			dialog --backtitle "$BGTITLE" --msgbox "Could not automatically upload output to http://www.pastebin.ca.\nPossible reasons are:\n\n    1. Couldn't find 'wget' in your PATH\n    2. Your version of wget is less than 1.8.2\n\nPlease manually upload $NFILE to http://www.pastebin.ca/upload.php and submit your post." 25 100
-		fi
-	fi
-fi
-- 
1.8.3.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
