Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F902C9BF0
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Oct 2019 12:16:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B34C167B;
	Thu,  3 Oct 2019 12:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B34C167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570097787;
	bh=V08EPbYwvI1Hn4Yxp2GWOFE8GrvzW71t96Z41/9zSmw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=noRedoMFZa8pKyjDVv1o6sSnbw1Z0X8hdzwU4PjRwiCOLz3hdXyB2Rfd8ePOf6AgG
	 569KiW+m5k16DYEKlxlEUYGT1amsW2zGA/Vsayz4XhaoMYcS93pXyxkuJENPOEYYi3
	 8zIf87CO3rPDnHZZZRRXzStjOvkAjiQcXdajvqXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8F82F80506;
	Thu,  3 Oct 2019 12:14:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3C33F80518; Thu,  3 Oct 2019 12:14:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3956DF800DE
 for <alsa-devel@alsa-project.org>; Thu,  3 Oct 2019 12:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3956DF800DE
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E28D4AD63;
 Thu,  3 Oct 2019 10:14:35 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  3 Oct 2019 12:13:54 +0200
Message-Id: <bd685232ea511251eeb9554172f1524eabf9a46e.1570097621.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002081717.GA4015@kitsune.suse.cz>
References: <20191002081717.GA4015@kitsune.suse.cz>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [alsa-devel] [PATCH v2 1/2] soundwire: depend on ACPI
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

VGhlIGRldmljZSBjYW5ub3QgYmUgcHJvYmVkIG9uICFBQ1BJIGFuZCBnaXZlcyB0aGlzIHdhcm5p
bmc6Cgpkcml2ZXJzL3NvdW5kd2lyZS9zbGF2ZS5jOjE2OjEyOiB3YXJuaW5nOiDigJhzZHdfc2xh
dmVfYWRk4oCZIGRlZmluZWQgYnV0Cm5vdCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0KIHN0YXRp
YyBpbnQgc2R3X3NsYXZlX2FkZChzdHJ1Y3Qgc2R3X2J1cyAqYnVzLAogICAgICAgICAgICBefn5+
fn5+fn5+fn5+CgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpGaXhlczogN2MzY2QxODliODZk
ICgic291bmR3aXJlOiBBZGQgTWFzdGVyIHJlZ2lzdHJhdGlvbiIpClNpZ25lZC1vZmYtYnk6IE1p
Y2hhbCBTdWNoYW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9zb3VuZHdpcmUv
S2NvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zb3VuZHdpcmUvS2NvbmZpZyBiL2RyaXZlcnMvc291bmR3aXJlL0tjb25maWcK
aW5kZXggZjUxODI3M2NmYmUzLi5jNzNiZmJhYTI2NTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc291
bmR3aXJlL0tjb25maWcKKysrIGIvZHJpdmVycy9zb3VuZHdpcmUvS2NvbmZpZwpAQCAtNSw2ICs1
LDcgQEAKIAogbWVudWNvbmZpZyBTT1VORFdJUkUKIAl0cmlzdGF0ZSAiU291bmRXaXJlIHN1cHBv
cnQiCisJZGVwZW5kcyBvbiBBQ1BJCiAJaGVscAogCSAgU291bmRXaXJlIGlzIGEgMi1QaW4gaW50
ZXJmYWNlIHdpdGggZGF0YSBhbmQgY2xvY2sgbGluZSByYXRpZmllZAogCSAgYnkgdGhlIE1JUEkg
QWxsaWFuY2UuIFNvdW5kV2lyZSBpcyB1c2VkIGZvciB0cmFuc3BvcnRpbmcgZGF0YQotLSAKMi4y
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNh
LWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
