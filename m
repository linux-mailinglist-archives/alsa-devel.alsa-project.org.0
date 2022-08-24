Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3ED59FC86
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 16:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D47685D;
	Wed, 24 Aug 2022 16:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D47685D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661349696;
	bh=KWnwJ1zMa3C2CDw6Y/OMLmmwDWaJ+biZe3MkwUbZHYs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RyOmbdgh6W8LrM+mNSOVTkm9Olxm+a89cfSIpGIoBOu/eNjEoxmpy24LKr+V5dI7Q
	 K8upZpysce5/a460byVlPL425DjKz+ORr/3WzZ1yASodeZ+wIJUoz1nlLX2WLhDZuW
	 WWEG6Mcdz30hkOkO2rKgg4VuZ5k+nSBlPixExkxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAE3DF80525;
	Wed, 24 Aug 2022 16:00:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CF32F8014E; Wed, 24 Aug 2022 16:00:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 153E1F8014E
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 16:00:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 153E1F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="xYytor4R"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78BE9617CA;
 Wed, 24 Aug 2022 13:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A3EC433D7;
 Wed, 24 Aug 2022 13:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661349598;
 bh=KWnwJ1zMa3C2CDw6Y/OMLmmwDWaJ+biZe3MkwUbZHYs=;
 h=From:To:Cc:Subject:Date:From;
 b=xYytor4RJ8GRoHDLUA3TaZ9L/xtJ0TSzUzd8eYZwFZUYTlZJoyJzIX6VPNQ4kWlvB
 /mEkcpnn+u4OEMEyOfh3v66v2TtHwlgpU7ErpY+5PPGzX5QJL9s2ECgzO8NG4T4p10
 ECDFw+dnybc0XE1nrvBqsyelkp3AwXbRJSEyI2sQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/6] sysfs: do not create empty directories if no
 attributes are present
Date: Wed, 24 Aug 2022 15:59:46 +0200
Message-Id: <20220824135951.3604059-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2703;
 i=gregkh@linuxfoundation.org; h=from:subject;
 bh=KWnwJ1zMa3C2CDw6Y/OMLmmwDWaJ+biZe3MkwUbZHYs=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDMlseleWz0p77dt8m1tRzqymifO7SvSa+rS3M/3+ef91PVd/
 565YRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAExkvwDDPPUPRss8Dk0ItLX7e80gh0
 32681eC4YFM9ZNVL4f/e7no65TiZp5vyfVvXaWAwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

When creating an attribute group, if it is named a subdirectory is
created and the sysfs files are placed into that subdirectory.  If no
files are created, normally the directory would still be present, but it
would be empty.  Clean this up by removing the directory if no files
were successfully created in the group at all.

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: new patch

Note, totally untested!  The following soundwire patches will need this,
if a soundwire developer could test this out, it would be most
apreciated.

fs/sysfs/group.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index eeb0e3099421..9fe0b47db47f 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -31,12 +31,14 @@ static void remove_files(struct kernfs_node *parent,
 			kernfs_remove_by_name(parent, (*bin_attr)->attr.name);
 }
 
+/* returns -ERROR if error, or >= 0 for number of files actually created */
 static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 			kuid_t uid, kgid_t gid,
 			const struct attribute_group *grp, int update)
 {
 	struct attribute *const *attr;
 	struct bin_attribute *const *bin_attr;
+	int files_created = 0;
 	int error = 0, i;
 
 	if (grp->attrs) {
@@ -65,6 +67,8 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 						       gid, NULL);
 			if (unlikely(error))
 				break;
+
+			files_created++;
 		}
 		if (error) {
 			remove_files(parent, grp);
@@ -95,12 +99,15 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 							   NULL);
 			if (error)
 				break;
+			files_created++;
 		}
 		if (error)
 			remove_files(parent, grp);
 	}
 exit:
-	return error;
+	if (error)
+		return error;
+	return files_created;
 }
 
 
@@ -146,10 +153,16 @@ static int internal_create_group(struct kobject *kobj, int update,
 		kn = kobj->sd;
 	kernfs_get(kn);
 	error = create_files(kn, kobj, uid, gid, grp, update);
-	if (error) {
+	if (error <= 0) {
+		/*
+		 * If an error happened _OR_ if no files were created in the
+		 * attribute group, and we have a name for this group, delete
+		 * the name so there's not an empty directory.
+		 */
 		if (grp->name)
 			kernfs_remove(kn);
-	}
+	} else
+		error = 0;
 	kernfs_put(kn);
 
 	if (grp->name && update)
-- 
2.37.2

