Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BEDC499E
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 10:35:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAE1F167B;
	Wed,  2 Oct 2019 10:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAE1F167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570005331;
	bh=7emjAkLJSM9Q7rr5J6qlMfbjwAUQPbz9gKWiQERLBdg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aEVAIjlE8PyVQkZe2lOmLZcNJPV0J5pD0y624Gf4v7XJrhPVOxXMucEp9qgScB/NE
	 v7DsQ1jfa2x+eA7fE5IJH0Pd1i7Bi1ysQjNc0LAeigm1Lq2ozRep8NepeTz+rUm2Ud
	 Q9FsceicC3EjI7SvHCxEX+zMwP5BYYArSzIRjv+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD18F803D5;
	Wed,  2 Oct 2019 10:33:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 178B4F8036E; Wed,  2 Oct 2019 10:33:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BD67F8016F
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 10:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BD67F8016F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B6B21B090;
 Wed,  2 Oct 2019 08:33:40 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed,  2 Oct 2019 10:33:29 +0200
Message-Id: <459d62805e8cb20e27667626e80d962569e7e83a.1570005196.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002081717.GA4015@kitsune.suse.cz>
References: <20191002081717.GA4015@kitsune.suse.cz>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [alsa-devel] [PATCH 1/2] soundwire: depend on ACPI
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
fn5+fn5+fn5+CgpGaXhlczogN2MzY2QxODliODZkICgic291bmR3aXJlOiBBZGQgTWFzdGVyIHJl
Z2lzdHJhdGlvbiIpClNpZ25lZC1vZmYtYnk6IE1pY2hhbCBTdWNoYW5layA8bXN1Y2hhbmVrQHN1
c2UuZGU+Ci0tLQogZHJpdmVycy9zb3VuZHdpcmUvS2NvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb3VuZHdpcmUvS2NvbmZp
ZyBiL2RyaXZlcnMvc291bmR3aXJlL0tjb25maWcKaW5kZXggZjUxODI3M2NmYmUzLi5jNzNiZmJh
YTI2NTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc291bmR3aXJlL0tjb25maWcKKysrIGIvZHJpdmVy
cy9zb3VuZHdpcmUvS2NvbmZpZwpAQCAtNSw2ICs1LDcgQEAKIAogbWVudWNvbmZpZyBTT1VORFdJ
UkUKIAl0cmlzdGF0ZSAiU291bmRXaXJlIHN1cHBvcnQiCisJZGVwZW5kcyBvbiBBQ1BJCiAJaGVs
cAogCSAgU291bmRXaXJlIGlzIGEgMi1QaW4gaW50ZXJmYWNlIHdpdGggZGF0YSBhbmQgY2xvY2sg
bGluZSByYXRpZmllZAogCSAgYnkgdGhlIE1JUEkgQWxsaWFuY2UuIFNvdW5kV2lyZSBpcyB1c2Vk
IGZvciB0cmFuc3BvcnRpbmcgZGF0YQotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRl
dmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
