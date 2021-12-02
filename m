Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E87D44665CC
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 15:50:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6203626FF;
	Thu,  2 Dec 2021 15:49:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6203626FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638456630;
	bh=VnqBObnHKSyQymRoDWGRwBEmJoaCzR+2RjRtMXqEq7Y=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CsJQygdgYVmtHbuKZLw9DOpRuoBc6HovGodRCuhaPrF5IH3js9Em2RG3Ywx07JW0S
	 pzQ/5+wazPZjmaURqGKZXcaTH/cTkabMlOFgzIRFtbxdKfKs/g2JI/HYuucexSRhbz
	 iytsb5woYYNMGNI0MFsnX5CVQ2tqJZOnFh0uU6YM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29CA7F804AD;
	Thu,  2 Dec 2021 15:49:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A18BF804F1; Thu,  2 Dec 2021 15:49:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D86BF804EC
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 15:49:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D86BF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KTfZbkE1"
Received: by mail-wr1-x42b.google.com with SMTP id d9so39355870wrw.4
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 06:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language;
 bh=OfuY+eiincZMQL8kVF+3iuVVEEjBU8iSSXMtx2zz3h8=;
 b=KTfZbkE1sxtQNJQGDoCIB5uNXx6pIR5tocB6eVy/XyLdo60tmps5aVl+Z7AIq1iW0o
 Cl8CXdrSyaz42F1WJkS5fH82dQljkL3UsnNieGExVGFGYBkA3OCFY/wTEF2E0cKXh1x0
 6OAkVds8u3Yf2EHR7XlSUlAMuVgRITE+w+weWwug2HbooWLP5w4nO1zGvVzxytMGLOAv
 624KhRlQBgykzpysF0+hMY1Yc7EaOi7LCPSlH+ntx9CvBiKrX+pdndciY2tU2kW1XuaW
 YjJradqX9CAtM3pUhOKRCNC54e8aFS3PeqEVEVy1jBtENrxEJiceJN9DYHIiAWROhKcQ
 pDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language;
 bh=OfuY+eiincZMQL8kVF+3iuVVEEjBU8iSSXMtx2zz3h8=;
 b=N2KvO8WkRSxs/5bsgcVL6RbYcN/zyKzrysl1+gIpmflcaS1XYfIWnYB/h7XgABUwOx
 Qgjlo1cqFcWeUw8kMOq9FjYk2Ua7VeRiieFSrTQFS4rbeJvxIZ4Qjmgrqja4lOUizFYd
 bYyMyBCW/XAOmVyljAvyxRRKeRO0tUxM3EL19NIoez7kYupH2NNm7ogRpIgY9SzEKZlb
 XKxhy8VT5nhciqkpF3oK4fiEaKBQB/Ev+xRD9umYrljilTrQJ0wK6hWoG/yjylGO91fc
 SGjThSY5go70OA0mdIfoGQxv0EZNvtAMBIkOOFZWZWIeNLNmDd4FRTWxse2NuVTGScl3
 ToHA==
X-Gm-Message-State: AOAM530DdkGhQQduF4VX07u3FKGvq9vlLyflf/hBXX1QWX9worNQ+yBP
 v/sqWvU18pdercJ6pxWyP4M=
X-Google-Smtp-Source: ABdhPJzEewYRFG8JbWqVUXCLGEwlG4VUWOHCA00n8L5NafxB+QOtu55jNCbVSKheb3nVAxT6S0GYzA==
X-Received: by 2002:a5d:628f:: with SMTP id k15mr15709189wru.363.1638456542872; 
 Thu, 02 Dec 2021 06:49:02 -0800 (PST)
Received: from [192.168.11.11] (37.194.143.150.dyn.plus.net. [150.143.194.37])
 by smtp.googlemail.com with ESMTPSA id
 g18sm3035210wmq.4.2021.12.02.06.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 06:49:02 -0800 (PST)
From: Alan Young <consult.awy@gmail.com>
Subject: [PATCH] ALSA: ctl: Fix copy of updated id with element read/write
To: alsa-devel@alsa-project.org
Message-ID: <0d3e1401-22c7-701c-b38a-2f757e9b6022@gmail.com>
Date: Thu, 2 Dec 2021 14:49:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------69514240A094609E25D9C5B5"
Content-Language: en-GB
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>
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

This is a multi-part message in MIME format.
--------------69514240A094609E25D9C5B5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"

When control_compat.c:copy_ctl_value_to_user() is used, by
ctl_elem_read_user() & ctl_elem_write_user(), it must also copy back the
snd_ctl_elem_id value that may have been updated (filled in) by the call
to snd_ctl_elem_read/snd_ctl_elem_write().

This matches the functionality provided by snd_ctl_elem_read_user() and
snd_ctl_elem_write_user(), via snd_ctl_build_ioff().

Without this, and without making additional calls to snd_ctl_info()
which are unnecessary when using the non-compat calls, a userspace
application will not know the numid value for the element and
consequently will not be able to use the poll/read interface on the
control file to determine which elements have updates.

Signed-off-by: Alan Young [1]<consult.awy@gmail.com>
---
 sound/core/control_compat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 470dabc60aa0..edff063e088d 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -264,6 +264,7 @@ static int copy_ctl_value_to_user(void __user *userdata,
                                  struct snd_ctl_elem_value *data,
                                  int type, int count)
 {
+       struct snd_ctl_elem_value32 __user *data32 = userdata;
        int i, size;

        if (type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
@@ -280,6 +281,8 @@ static int copy_ctl_value_to_user(void __user *userdata,
                if (copy_to_user(valuep, data->value.bytes.data, size))
                        return -EFAULT;
        }
+       if (copy_to_user(&data32->id, &data->id, sizeof(data32->id)))
+               return -EFAULT;
        return 0;
 }

--
2.25.1

References

   1. mailto:consult.awy@gmail.com

--------------69514240A094609E25D9C5B5
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ALSA-ctl-Fix-copy-of-updated-id-with-element-read-wr.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-ALSA-ctl-Fix-copy-of-updated-id-with-element-read-wr.pa";
 filename*1="tch"

From 8dfd143c2e05405bc1f61107c5858eab9c5fc847 Mon Sep 17 00:00:00 2001
From: Alan Young <consult.awy@gmail.com>
Date: Mon, 8 Nov 2021 12:39:56 -0500
Subject: [PATCH] ALSA: ctl: Fix copy of updated id with element read/write

When control_compat.c:copy_ctl_value_to_user() is used, by
ctl_elem_read_user() & ctl_elem_write_user(), it must also copy back the
snd_ctl_elem_id value that may have been updated (filled in) by the call
to snd_ctl_elem_read/snd_ctl_elem_write().

This matches the functionality provided by snd_ctl_elem_read_user() and
snd_ctl_elem_write_user(), via snd_ctl_build_ioff().

Without this, and without making additional calls to snd_ctl_info()
which are unnecessary when using the non-compat calls, a userspace
application will not know the numid value for the element and
consequently will not be able to use the poll/read interface on the
control file to determine which elements have updates.

Signed-off-by: Alan Young <consult.awy@gmail.com>
---
 sound/core/control_compat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 470dabc60aa0..edff063e088d 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -264,6 +264,7 @@ static int copy_ctl_value_to_user(void __user *userdata,
 				  struct snd_ctl_elem_value *data,
 				  int type, int count)
 {
+	struct snd_ctl_elem_value32 __user *data32 = userdata;
 	int i, size;
 
 	if (type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
@@ -280,6 +281,8 @@ static int copy_ctl_value_to_user(void __user *userdata,
 		if (copy_to_user(valuep, data->value.bytes.data, size))
 			return -EFAULT;
 	}
+	if (copy_to_user(&data32->id, &data->id, sizeof(data32->id)))
+		return -EFAULT;
 	return 0;
 }
 
-- 
2.25.1



--------------69514240A094609E25D9C5B5--
