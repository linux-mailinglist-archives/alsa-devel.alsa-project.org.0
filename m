Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD540852BB1
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 09:53:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A69E7B6A;
	Tue, 13 Feb 2024 09:53:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A69E7B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707814427;
	bh=pJNBMZwflHJz4uji9HQGOcdfnUICX80CQcTMG+DJXzc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hvd0KWE56tPzorwdq7uyqxADOMtpUiOU2RI78HWMSAqBvZCbaTarB7P94Tjo5qnrs
	 K/fcKv40yovc2ueKNVfcnBKQKKohQS4UP6KIDYs/qbTbiIKBBHhbruJePYNStMSAej
	 UI6htW0NOZDG2sMAMo+e3pDmeeCyFE0lOSnbyJOc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58DD1F805A1; Tue, 13 Feb 2024 09:53:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08912F805A1;
	Tue, 13 Feb 2024 09:53:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A63BF80238; Tue, 13 Feb 2024 09:53:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu
 [18.185.115.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DD2AF8015B
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 09:52:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DD2AF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=opensynergy.com header.i=@opensynergy.com
 header.a=rsa-sha256 header.s=TM-DKIM-20210503141657 header.b=aAXdbRkE
Received: from 104.47.7.169_.trendmicro.com (unknown [172.21.165.80])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 4672110000D8D;
	Tue, 13 Feb 2024 08:52:49 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1707814333.470000
X-TM-MAIL-UUID: dab96c05-9bce-4c16-b88f-f6f2c60f4576
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown
 [104.47.7.169])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id
 72DCD10002B8E;
	Tue, 13 Feb 2024 08:52:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKLbLLrNA0ZxpEReIHBEbCsZ8tC4bjR6u2QWQy/H5IG/di4GHd1b/fs63lyjEQgHuoFRvjrA7O3jHf4dUiOIBg+qxXlKs+ZEINF3H87saYBdIpjzIEQJwZgyT/o3qx/GoE4rzFIFgCN5Cikn2Y59/3+ADIY3Cy8nmt8zEq4fX13nuS6AHYm719R/Aur32yqwNwU4RUM2TBqdlXIy0vAlxwn3CN9djeLXoAWO3vWr/i5pbOtz6Xw/eJa2SFgqk6Jl5/yRkJpOAJWNK4H6fXQE2OJ93VFg/CDu3oR8k3LgYDH0Z7pQ5FscIw3BdnWCGIPPLk7u7sxQ0SzVArbzYrpBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVtfM+mUa37QXjaTkP+Fax9BcUjbx3upuIqIJIIthXM=;
 b=aARAzf0UNpi2StKkR9FLRXqRt4s5G+oJM8jGxMJ+mKQiulv0QThHr3PnZCB3moNqcEIscoB1jgPPzpQw4inACTj31s12Vr7r/MCqDy5QmJRYcLuq39Rv4yPhdNbTCKgVdfj0WKtNZvxaf3qZcpQ9y48yyKmE1IPnf9iOx5fdPTP6pWlSjRgtK8cw7iCoPJz8BZxq5M/ZqDn1KXLHKIO0YOJFKsNNSqngprO2povdfE6fjzKGTMpGDBm6OBcz2Gd7LSbg3MKiw9maumj2HTwueT1ihhFQ2fTXecchKL0c4JmkNuM7C6Ef/YUw+9iI90Rjnh/VeIrk5usi8KC6YPNcXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.66.60.4) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensynergy.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=opensynergy.com; dkim=none (message not signed);
 arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.66.60.4)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=opensynergy.com;
Received-SPF: Pass (protection.outlook.com: domain of opensynergy.com
 designates 217.66.60.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.66.60.4; helo=SR-MAIL-03.open-synergy.com; pr=C
From: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	virtualization@lists.linux-foundation.org,
	virtio-dev@lists.oasis-open.org
Cc: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	coverity-bot <keescook+coverity-bot@chromium.org>
Subject: [PATCH] ALSA: virtio: Fix "Coverity: virtsnd_kctl_tlv_op():
 Uninitialized variables" warning.
Date: Tue, 13 Feb 2024 09:51:30 +0100
Message-Id: <20240213085131.503569-1-aiswarya.cyriac@opensynergy.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70B:EE_|FR2P281MB2315:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e943ce6-e529-439d-65f3-08dc2c711186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2YAxed70RTOtBFmp/P9aiwwkQdGmXsv/qkBxkHLlSDIiP3e/B/GnmIlKkj9kWo4IqgFWTO69xfPYeGvGMPAc8IHGMhaju9AuNotHP8Ns9xpkCB//s5xIzSQo9jRQdclxmcx2uAk6+ZFufXmxRIRkF46pxVrtP2T5NUZFFlbd+OacRXO9ignXA5KpeimBb8qpooLQY5wb4/VINKCPnweFymDcy8JXB6fMUjrrhtvf6eZXdMVmd8msQgCsODUIqGNJ84l/j9rXF8brdBhzOp4ndxtxjKaEZdQmmxGKs6OC7+yG4GZ6psR/KXMLBfCNBi4VPdSnlfEi4AHN/axUsl7PRDCXvdBCmHfnc9HQiH7tDRFuXfPR6t4PhhoAMjuf5FpwmitvGeuMS3b69o99qoKYEeJn+SibWiINNLR1yNLznsKLC4UXo+jkUg1WQJEmCfG+qmSVv1YV4AMnti9gsgNWkzLEyjq+IqtBroBnFEzs806h8JWch7BNAOrTvvCJ+WTAXKHUcEDff7O9spF+4Vp/iLLY+cZIBz5xFRJsG7jcL0+Mgg+WGPZuaQPbNmIExEhLh7VfDMF5xIFcfzsL8AV+RNG5BQ8Wr3v6oMzv33Ok6aw=
X-Forefront-Antispam-Report: 
	CIP:217.66.60.4;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376002)(136003)(39830400003)(346002)(396003)(230273577357003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(82310400011)(46966006)(36840700001)(44832011)(70206006)(70586007)(4326008)(8936002)(8676002)(54906003)(2906002)(5660300002)(83380400001)(1076003)(26005)(336012)(81166007)(36756003)(86362001)(42186006)(316002)(41300700001)(2616005)(478600001);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 08:52:11.5933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9e943ce6-e529-439d-65f3-08dc2c711186
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[217.66.60.4];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB2315
X-TM-AS-ERS: 104.47.7.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28188.006
X-TMASE-Result: 10-0.284100-4.000000
X-TMASE-MatchedRID: xt1fvVgCaAwxbzLOgy4/xv0hW+Pi7Cos33BNXDnVnRkTWADzICCSxR2U
	kupZbUME3jBO0ohdxYKsoTBqZmmQckwRRkZSjMxDBA/ZR5qnp8Puc70WAkC6Fb2L79/20sYbi8+
	IGr+Jb3Uyk/Hw4XN9jdxtn8NMQCb4g9lOaESqwrR81fikUYgyLXJ8bM38R9gpe8ED0L/V6IVIlq
	ldglC+k9h5c4TN8zbZqsgm1VRq1bBfrtMrqkRKbt2tdLwFGjEKBJetwkYd1rZxg7svMtapLuGtu
	J1W9CjFXZhtNOpHxd2wLw1yoK50Yl8BHB5PWxmaGlU8z8uyv6I=
X-TMASE-XGENCLOUD: 62ba0d4e-00ee-46ea-ba60-df3068f360b9-0-0-200-0
X-TM-Deliver-Signature: B607B23BDF002E2A03AC907A5CBF26E9
X-TM-Addin-Auth: /0ntcSQQ6+WXql+2/8jp2LAjSTh+UI1MznRkQ79u+n3qEikt3guF8VqQWZe
	SgOz1PvUrddwjiSRKkpqomri96mXremsQIAGZ26QyxuLcJTgI8Uyfb9a+Xx5SuUXLRtjXNU1uNc
	05jP6rAgqRMEgvj2dVbX7PZc73KAtiK2yD7tomVTf4KJzcoPfkbNOEKSph00vZ6S6WfbOvKArPY
	dJwddsfhKv9lTgzecynlEeXHcITMbquRAsqUbwU195Bmu8prjuFkGJpJHEsLIZIGWW9vdx72ZDu
	Rs32KW5zQ/BngnNsXJb3psyLat4IzhKTzSUc.DfpMVXUCSx7THZPsgIwVjR1xBusZK2vr9c1qiI
	PKeuViq7xiZCXEvJYP1vopeUS0AIH4J0h/I+ePZtc8nT44kDNZzq4Ij2M0zruSprFT1kDrDf/Sd
	PZYwM+n8ECAPdIQ6JDTicyrFUCSO5//IQL6VwaVquYXy3mbiWbOh0Np+IONrOefhnDhbfV3C9Vy
	KjC+X/8s0LLunjke8KUX17OTCCvL+I1c46qVzFkB4Q50h19HKyHJyxku+e7bl/yyAxxJymqPEQb
	6RVID9SUshrElo3URr1DrOf8gttmXKYUr9e0pJ2XCReEp2o9Ra0nBR6JiFUUMH4QTbBOVjiI0Jt
	A1pw==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1707814369;
	bh=pJNBMZwflHJz4uji9HQGOcdfnUICX80CQcTMG+DJXzc=; l=1408;
	h=From:To:Date;
	b=aAXdbRkEx7vT4dUzQiIYecLqHWXxzUOXrdY1ycHk9YmvWLHXC7tzFQArglB87KB0z
	 iTv/koki5+YN1iiirRaRQtESQ/NC7NecG0BvFKghMCXZFKO2IICSefZFK97g8Aib3V
	 e/PKf5YJEIdSkl1AR1MXgGDrNQj1ImoV6Y0Zc54fxULq8tP1ApDTcQnATtph+e1OrN
	 Mpzq7lZWSdlszpBZO/NqMD6gIgJTDE/z873rcErs4BgKgYRlDBU3LwAraxZOaCBfhm
	 9pczfHYs9GnUEQ/HrbJmw1OMqwUlf8PkXObNNv6U9sLNMJK4/1FzioaBEjgm24AHm+
	 DrzP47PasF9wg==
Message-ID-Hash: 55ZU5IMRRCBHLZGY7ZBNYMBETK35KHVL
X-Message-ID-Hash: 55ZU5IMRRCBHLZGY7ZBNYMBETK35KHVL
X-MailFrom: Aiswarya.Cyriac@opensynergy.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/55ZU5IMRRCBHLZGY7ZBNYMBETK35KHVL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix the following warning when building virtio_snd driver.

"
*** CID 1583619:  Uninitialized variables  (UNINIT)
sound/virtio/virtio_kctl.c:294 in virtsnd_kctl_tlv_op()
288
289         break;
290       }
291
292       kfree(tlv);
293
vvv     CID 1583619:  Uninitialized variables  (UNINIT)
vvv     Using uninitialized value "rc".
294       return rc;
295     }
296
297     /**
298      * virtsnd_kctl_get_enum_items() - Query items for the ENUMERATED element type.
299      * @snd: VirtIO sound device.
"

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Signed-off-by: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1583619 ("Uninitialized variables")
Fixes: d6568e3de42d ("ALSA: virtio: add support for audio controls")
---
 sound/virtio/virtio_kctl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/virtio/virtio_kctl.c b/sound/virtio/virtio_kctl.c
index 0c6ac74aca1e..d7a160c5db03 100644
--- a/sound/virtio/virtio_kctl.c
+++ b/sound/virtio/virtio_kctl.c
@@ -286,6 +286,11 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
 		else
 			rc = virtsnd_ctl_msg_send(snd, msg, &sg, NULL, false);
 
+		break;
+	default:
+		virtsnd_ctl_msg_unref(msg);
+		rc = -EINVAL;
+
 		break;
 	}
 
-- 
2.43.0

