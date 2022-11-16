Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C09630D58
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Nov 2022 09:42:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEEDC1655;
	Sat, 19 Nov 2022 09:41:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEEDC1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668847363;
	bh=J8p5sG/5v+l6rkzif+hMVNlNXzBBrhFWlBglCbHqmB0=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LToJUq3zOK+MNq6galhBfTZRO3QbR4mzhM49nTux4MAAfkZ1AtoJMJsFyjr+Tk41R
	 qwX6UL6N8iioY6PbPSNQ553mVYzorX2NOz+xq8u2icgV4AFHUeQzHWaTHSYmb4x/Wr
	 5+qevcW2jKNkR+Ldeu1Y8QlBWY4/A8/Zxa+CJH04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B94CDF80563;
	Sat, 19 Nov 2022 09:40:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89265F80169; Wed, 16 Nov 2022 20:45:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com
 [IPv6:2607:f8b0:4864:20::f4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56C2BF80089
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 20:45:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56C2BF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="jywSTuWw"
Received: by mail-qv1-xf4a.google.com with SMTP id
 e13-20020ad450cd000000b004bb49d98da4so14011201qvq.9
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 11:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=G2ESkY2l72WGHHGXM2VK55EVf3ZuzrGpilZXK1RSfTw=;
 b=jywSTuWwST9cgN7wepEN/7sO4whklwgBjZKqgQls8CYQcjB1e56rDmZGzPmrrDgh14
 iPFyUrVphT9n10hsGyVnX73V786KxRy6VnXhceLiJwq6faW0sGBzRLYQSnGPMJQo8PgG
 5pUQoip8GJ1t+5ONxQ9WIfrbjiz5XE4pOS6DxVtsJz2odpF+OmuXklPX5s2XPnrpj9KW
 iVEp9PnAKgvJoEz4Bva1KC28SpiikonA2D0EifRNdjP0g1SYp8R24vYTHdks79Wb9VU/
 ZtUEevf1lG5U5JvynqSrcwhrPEyxNYwFnJdbZxzSfkIBU2d+py8WRiA2Xf1CXTKfWB7+
 TL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G2ESkY2l72WGHHGXM2VK55EVf3ZuzrGpilZXK1RSfTw=;
 b=dU735G81LrNhnXzJh9sH96fOS9V74z3JH3dB8Zffgq87ALTTVJVQY5BfXMUS9JjON1
 FUnv+XNjrJnsnra6La/et/PkGAm6gJQcfH09G1j4NiQ4OY5Rs6DQGAPJ4IK+MGNC5BUC
 JLXAG0Mr59IsFCaPUaWuNxocH9S+SYMZQdf6OhJ1sK+Q0yMSCZ3cbmoYLxjilii2nQzC
 tAv2ruJzxVJ1UM85RgZTgzi8DjWw/Gm9p9M5bnWtLcOFSD8CwrInlGoR4UgSnuo0a8EU
 zaDdPOfPXNW77G2tzNvFXV6V44j9WME34P0gpdm9SoUK1Vngw90tpCQ+edhQqX9K0z8E
 bT6w==
X-Gm-Message-State: ANoB5pmhMFYZ5yaCBXhTp8QeEH+hUJmRKzAO/Xwmyaz3P6JJwqogm8pJ
 hWfRBbFeJOHnT/cZXa+F0J1/3XwsRWG1pnwkmQ8CeEYEGQ+rsAlhyz98JNVc58IqQYTG3EEaRYd
 ZbIQOhLvmn/L9zNkheg9GN3cLYXdjsw9cA+D8I6I8j8ZCBWT/9L+nurhU/vbt+8ti8LnxMXceug
 ==
X-Google-Smtp-Source: AA0mqf7A86ArYBwzPmI0fd8zmIbSz+00hiWv5u6tEJIonZleB7DLckEsbJ7u7mKBzBglCpDgy/yF8i/x4BLVmQ==
X-Received: from jiaozhou11.nyc.corp.google.com
 ([2620:0:1003:314:cecf:fad1:3dce:59cf])
 (user=jiaozhou job=sendgmr) by 2002:a0c:ac4d:0:b0:4bf:dc42:ec0d with SMTP id
 m13-20020a0cac4d000000b004bfdc42ec0dmr22303939qvb.49.1668627953052; Wed, 16
 Nov 2022 11:45:53 -0800 (PST)
Date: Wed, 16 Nov 2022 14:45:50 -0500
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221116194550.705566-1-jiaozhou@google.com>
Subject: [PATCH] kernel: Add HP Device 0x8711 to force connect list
From: Jiao Zhou <jiaozhou@google.com>
To: ALSA development <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 19 Nov 2022 09:40:31 +0100
Cc: Jiao Zhou <jiaozhou@google.com>
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

Signed-off-by: Jiao Zhou <jiaozhou@google.com>
---
HDMI audio is not working on the HP EliteDesk 800 G6 because the pin is
unconnected. This issue can be resolved by using the 'hdajackretask'
tool to override the unconnected pin to force it to connect.

Change-Id: If7ffc0691466078e59240f9eab89de562b3f119d
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 21edf7a619f0..7a40ddfd695a 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1975,6 +1975,7 @@ static int hdmi_add_cvt(struct hda_codec *codec, hda_nid_t cvt_nid)
 static const struct snd_pci_quirk force_connect_list[] = {
 	SND_PCI_QUIRK(0x103c, 0x870f, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
+	SND_PCI_QUIRK(0x103c, 0x8711, "HP", 1),
 	SND_PCI_QUIRK(0x1462, 0xec94, "MS-7C94", 1),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", 1),
 	{}
-- 
2.38.1.431.g37b22c650d-goog

