Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9297E25D6
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Nov 2023 14:41:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F3D4DEB;
	Mon,  6 Nov 2023 14:40:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F3D4DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699278089;
	bh=sbHeqy/8reGqaVMiS2UA+arx+lejDT/6T/0YzKo1wxk=;
	h=Date:To:From:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=C+UWDgQIMCFXSb9dar8x7QXHVcxp41ooeEPjZfO7+F9C3GW/lHxpOboaRsWpbz2tT
	 /2Zuk/tfsCszXshV3Y/w/bloHIlD5JtMouVzOJ3NjMXYyRS8pC8EQFhFDd4xh/q5uF
	 EM4/7zKPYnKG9fMOfFRzIu4qLb+ohrm4WE73Mc9g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66B3BF8059F; Mon,  6 Nov 2023 14:39:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3964F8057D;
	Mon,  6 Nov 2023 14:39:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76D98F8016D; Sun,  5 Nov 2023 16:29:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch
 [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0BA6F80125
	for <alsa-devel@alsa-project.org>; Sun,  5 Nov 2023 16:29:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0BA6F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256
 header.s=protonmail3 header.b=apr3vZsm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1699198180; x=1699457380;
	bh=sbHeqy/8reGqaVMiS2UA+arx+lejDT/6T/0YzKo1wxk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=apr3vZsm2k+5qf36OCvYkY0TT7vsqLyGCDxz7JBssB8vKeA9DW41BsfohWHBDVY1C
	 Ki3KABe2034ejpZ8KSHXyUqnpkXZZDQlxROSelibgKe2nLy+SBmx6Dmr6HK/y0oOo+
	 ode0nC8UTuDD53lciphvQAlAIpfbEneYIWHTbpjswP4kl1UMme5jOjLl42h7OhjnyE
	 hHA8mahHxMlcZSABbOwlqYVbBzcbjq9WOoq6z+UPqxmRvMoSlWhoGXkoiQr5cs+/Du
	 8dTpMQPeO7jRQ+tzPZfNCN0V5Ghx3km3+soxRppuaLIgsjv+dg9sU0x+T/SPhvuwuw
	 +NTsnFjC0hJYA==
Date: Sun, 05 Nov 2023 15:29:29 +0000
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/1] ALSA: hda: Add ASRock X670E Taichi to denylist
Message-ID: <20231105152834.5620-1-akoskovich@pm.me>
Feedback-ID: 37836894:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: AKoskovich@pm.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7OHNZU4JM3BEVHNLBNEGZ4NX2EALF7KW
X-Message-ID-Hash: 7OHNZU4JM3BEVHNLBNEGZ4NX2EALF7KW
X-Mailman-Approved-At: Mon, 06 Nov 2023 13:39:49 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7OHNZU4JM3BEVHNLBNEGZ4NX2EALF7KW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Recent AMD platforms expose an HD-audio bus but without any actual
codecs, which is internally tied with a USB-audio device, supposedly.
It results in "no codecs" error of HD-audio bus driver, and it's
nothing but a waste of resources.

snd_hda_intel 0000:59:00.6: no codecs found!

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 sound/pci/hda/hda_intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 5cfd00917..f727add4c 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2086,6 +2086,7 @@ static const struct pci_device_id driver_denylist[] =
=3D {
 =09{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1043, 0x874f) }, /* ASUS ROG Zenith =
II / Strix */
 =09{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1462, 0xcb59) }, /* MSI TRX40 Creato=
r */
 =09{ PCI_DEVICE_SUB(0x1022, 0x1487, 0x1462, 0xcb60) }, /* MSI TRX40 */
+=09{ PCI_DEVICE_SUB(0x1022, 0x15e3, 0x1022, 0xd601) }, /* ASRock X670E Tai=
chi */
 =09{}
 };
=20
--=20
2.41.0


