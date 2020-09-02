Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FE025A89C
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 11:29:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 887441803;
	Wed,  2 Sep 2020 11:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 887441803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599038998;
	bh=03BN3T704XeWq+deMB5w9JjoKp+Fs5P32AP7H6u/wDY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mNue+AQigQdhIgD+NvywIpyGdd1C752W7sN6szs37gOG3HSJNcajwptzQ70h1WcD1
	 +DWo1W+6mKJ9zsvpLgS7moMNrdWM7lpUp4GryVnuobCYV6LCfGFVp6VF+IbUFYbPxo
	 LJb+ZbffJDgkUNJlXZgG2KPjHBOG/tjpFkzqoh40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8AC7F801DA;
	Wed,  2 Sep 2020 11:28:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63F9BF80257; Wed,  2 Sep 2020 11:28:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.cccmz.de (mail.cccmz.de [5.9.50.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6ECCFF801DA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 11:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ECCFF801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cccmz.de header.i=@cccmz.de
 header.b="ZGXBS+6m"
Received: from tanjeffs-laptop.fritz.box (x4db458da.dyn.telefonica.de
 [77.180.88.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: tanjeff@cccmz.de)
 by mail.cccmz.de (Postfix) with ESMTPSA id E805417A2989;
 Wed,  2 Sep 2020 11:27:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cccmz.de; s=2019;
 t=1599038880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=aAXHcBWr3RGFkDVLAs8KJEWudANkl9WP2ltIxN499V4=;
 b=ZGXBS+6m/nZCgSC3hOlSg0vwtWiyLrOoHzBroJ0BBW8Utubf/TEaVFnV80fI6xxoH7oVxF
 +NuDJAw6wLDLAGMCqwS6kX9rhUTAQfKWt8PGBfsfIx48bPj+1BTTGfyEd+oNdee7fXu6iS
 vHqQIZuhq/qfQSyznKMp3JsdsVzYwo4=
From: "Tanjeff-N. Moos" <tanjeff@cccmz.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] control: Improve general control interface documentation.
Date: Wed,  2 Sep 2020 11:27:26 +0200
Message-Id: <20200902092727.2732-1-tanjeff@cccmz.de>
X-Mailer: git-send-email 2.17.1
Cc: Takashi Iwai <tiwai@suse.de>, "Tanjeff-N. Moos" <tanjeff@cccmz.de>
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

Signed-off-by: Tanjeff-N. Moos <tanjeff@cccmz.de>
---
 src/control/control.c | 72 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 9 deletions(-)

diff --git a/src/control/control.c b/src/control/control.c
index 1bcf1ab2..497a5399 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -31,7 +31,7 @@
 /*! \page control Control interface
 
 <P>Control interface is designed to access primitive controls. There is
-also interface notifying about control and structure changes.
+also an interface for notifying about control and structure changes.
 
 \section control_general_overview General overview
 
@@ -43,20 +43,74 @@ are managed according to below model.
      Some element sets can be added to a sound card by drivers in kernel and
      userspace applications.
  - element
-   - An element can be identified by userspace applications. Each element has
-     own identical information.
+   - A control element might be a master volume control, for example, or a
+     read-only indicator, such as a sync status. An element has a type (e.g.
+     INTEGER or BOOLEAN) and - depending on the type - min/max values, a step
+     size, a set of possible values (for enums), etc.
  - member
-   - An element includes some members to have a value. The value of each member
-     can be changed by both of userspace applications and drivers in kernel.
 
-Each element can be identified by two ways; the numerical number (numid), or the
-combination of interface, device, subdevice, name, and index.
+   - An element includes one or more member(s) to have a value. For
+     example, a stereo volume control element has two members (for
+     left/right).  The members share the same properties (e.g. both
+     volume controls have the same min/max values). The value of each
+     member can be changed by both of userspace applications and
+     drivers in kernel.
 
-The type of element set is one of integer, integerr64, boolean, enumerators,
+
+\section identifying_elements Identifying the Elements
+
+Each element has the following identifying properties:
+
+  - The numid (a numeric identifier, assigned when the sound card is
+    detected, constant while the sound card is kept connected)
+
+  - The interface type (e.g. MIXER, CARD or PCM)
+  - The device
+  - The subdevice
+  - Its name
+  - Its index
+
+An element can be identified either by its numid or by the tuple
+(interface type, device, subdevice, name, index). This tuple is always
+the same (driver updates can change it, but in practice this is
+rare). The numid can change on each boot. In case of an USB sound
+card, the numid can also change when it is reconnected.
+
+
+\section element_lists Element Lists
+
+An element list can be used to obtain a list of all elements of the
+sound card. The list contains generic information (e.g. how many
+elements the card has), and the identifying properties of the elements
+(numid, card, name, ...). See #snd_ctl_elem_list_t to learn more about
+element lists.
+
+
+\section working_with_elements Working with Elements
+
+It is possible to obtain information about an element using the
+snd_ctl_elem_info_*() functions. For enums, the allowed values can be
+obtained, for integers, the min/max values can be obtained, and so
+on. In addition, these functions can report the identifying
+properties. E.g. when the element is addressed using its numid, the
+functions complements the name, index, etc.
+
+To access the values of a control, use the snd_ctl_elem_value*()
+functions.  These allow to get and set the actual values or
+settings. It is also possible to get and set the ID values (such as
+the numid or the name).
+
+
+\section element_sets Element Sets
+
+The type of element set is one of integer, integer64, boolean, enumerators,
 bytes and IEC958 structure. This indicates the type of value for each member in
 elements included in the element set.
 
-When the value of member is changed, corresponding events are transferred to
+
+\section events Events
+
+When the value of a member is changed, corresponding events are transferred to
 userspace applications. The applications should subscribe any events in advance.
 
 \section tlv_blob Supplemental data for elements in an element set
-- 
2.17.1

