Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2394E13E381
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 18:02:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 949DB17C8;
	Thu, 16 Jan 2020 18:01:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 949DB17C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579194152;
	bh=f7tKnFBXD1YnxvL6zhtyI3prrJqlVf0yKNM0Yzeubv4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ndfearQvGZoA2BDBMhrymndFamwm4O3HoNJW7OGa3mhl21Qp1gPl3a1SSqmBMSIYZ
	 L/9KZv3MdU4Zy2NH/htSkeAQpbVNprhO8+KVCXWX8remx6VZyTVzzuu8bCnqQcZ0Xt
	 0z+5lzj0GriKcBiWOcE1tXrxbZRS5X+ZkGpgKx+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2E72F8014E;
	Thu, 16 Jan 2020 18:00:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D79F5F8022B; Thu, 16 Jan 2020 18:00:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 881B8F8016F
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 18:00:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 881B8F8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="izVDGGLP"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E10CE2073A;
 Thu, 16 Jan 2020 16:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193637;
 bh=vQOnwgcSUZ3IxlVxZdTcxxPpd0marI6QGKQVbOiDRiM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=izVDGGLPYEIER6Dujtnnkp4QpVBX4Fch0ABxsIbhm/b+FTLFkAKm9YWf2AvWfQcA/
 E0Dcx6T9LcGvkrNeZjDkAaZWrwuP8FKlYfsTLmTSj7R0sGLzS7sjeQgX6kU6j8Qdck
 PtxAuiO+Ux+dt4tyfASTQTVJrXEGLaPIe4N0onPM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 11:42:25 -0500
Message-Id: <20200116164300.6705-170-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116164300.6705-1-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jiada Wang <jiada_wang@mentor.com>,
 Nilkanth Ahirrao <anilkanth@jp.adit-jv.com>, Mark Brown <broonie@kernel.org>,
 Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [alsa-devel] [PATCH AUTOSEL 5.4 170/205] ASoC: rsnd: fix DALIGN
	register for SSIU
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

RnJvbTogTmlsa2FudGggQWhpcnJhbyA8YW5pbGthbnRoQGpwLmFkaXQtanYuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgZWY4ZTE0Nzk0MzA4YTQyOGIxOTRmOGIwNmFkOWFlMDZiNDM0NjZlNCBdCgpU
aGUgY3VycmVudCBkcml2ZXIgb25seSBzZXRzIDB4NzY1NDMyMTAgYW5kIDB4Njc0NTIzMDEgZm9y
IERBTElHTi4KVGhpcyBkb2VzbuKAmXQgd29yayB3ZWxsIGZvciBURE0gc3BsaXQgYW5kIGV4LXNw
bGl0IG1vZGUgZm9yIGFsbCBTU0lVLgpUaGlzIHBhdGNoIHByb2dyYW1zIHRoZSBEQUxJR04gcmVn
aXN0ZXJzIGJhc2VkIG9uIHRoZSBTU0lVIG51bWJlci4KCkNjOiBLdW5pbm9yaSBNb3JpbW90byA8
a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+CkNjOiBKaWFkYSBXYW5nIDxqaWFkYV93
YW5nQG1lbnRvci5jb20+CkNjOiBBbmRyZXcgR2FiYmFzb3YgPGFuZHJld19nYWJiYXNvdkBtZW50
b3IuY29tPgpGaXhlczogYTkxNGU0NDY5M2Q0MWIgKCJBU29DOiByc25kOiBtb3JlIGNsZWFyIHJz
bmRfZ2V0X2RhbGlnbigpIGZvciBEQUxJR04iKQpTaWduZWQtb2ZmLWJ5OiBOaWxrYW50aCBBaGly
cmFvIDxhbmlsa2FudGhAanAuYWRpdC1qdi5jb20+ClNpZ25lZC1vZmYtYnk6IEV1Z2VuaXUgUm9z
Y2EgPGVyb3NjYUBkZS5hZGl0LWp2LmNvbT4KQWNrZWQtYnk6IEt1bmlub3JpIE1vcmltb3RvIDxr
dW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDE5MTEyMTExMTAyMy4xMDk3Ni0xLWVyb3NjYUBkZS5hZGl0LWp2LmNvbQpTaWdu
ZWQtb2ZmLWJ5OiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6
IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBzb3VuZC9zb2Mvc2gvcmNhci9j
b3JlLmMgfCAyMCArKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NoL3JjYXIv
Y29yZS5jIGIvc291bmQvc29jL3NoL3JjYXIvY29yZS5jCmluZGV4IGU5NTk2YzIwOTZjZC4uYTZj
MWNmOTg3ZTZlIDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mvc2gvcmNhci9jb3JlLmMKKysrIGIvc291
bmQvc29jL3NoL3JjYXIvY29yZS5jCkBAIC0zNzYsNiArMzc2LDE3IEBAIHUzMiByc25kX2dldF9h
ZGlucl9iaXQoc3RydWN0IHJzbmRfbW9kICptb2QsIHN0cnVjdCByc25kX2RhaV9zdHJlYW0gKmlv
KQogICovCiB1MzIgcnNuZF9nZXRfZGFsaWduKHN0cnVjdCByc25kX21vZCAqbW9kLCBzdHJ1Y3Qg
cnNuZF9kYWlfc3RyZWFtICppbykKIHsKKwlzdGF0aWMgY29uc3QgdTMyIGRhbGlnbl92YWx1ZXNb
OF1bMl0gPSB7CisJCXsweDc2NTQzMjEwLCAweDY3NDUyMzAxfSwKKwkJezB4MDAwMDAwMzIsIDB4
MDAwMDAwMjN9LAorCQl7MHgwMDAwNzY1NCwgMHgwMDAwNjc0NX0sCisJCXsweDAwMDAwMDc2LCAw
eDAwMDAwMDY3fSwKKwkJezB4ZmVkY2JhOTgsIDB4ZWZjZGFiODl9LAorCQl7MHgwMDAwMDBiYSwg
MHgwMDAwMDBhYn0sCisJCXsweDAwMDBmZWRjLCAweDAwMDBlZmNkfSwKKwkJezB4MDAwMDAwZmUs
IDB4MDAwMDAwZWZ9LAorCX07CisJaW50IGlkID0gMCwgaW52OwogCXN0cnVjdCByc25kX21vZCAq
c3NpdSA9IHJzbmRfaW9fdG9fbW9kX3NzaXUoaW8pOwogCXN0cnVjdCByc25kX21vZCAqdGFyZ2V0
OwogCXN0cnVjdCBzbmRfcGNtX3J1bnRpbWUgKnJ1bnRpbWUgPSByc25kX2lvX3RvX3J1bnRpbWUo
aW8pOwpAQCAtNDExLDEzICs0MjIsMTggQEAgdTMyIHJzbmRfZ2V0X2RhbGlnbihzdHJ1Y3QgcnNu
ZF9tb2QgKm1vZCwgc3RydWN0IHJzbmRfZGFpX3N0cmVhbSAqaW8pCiAJCXRhcmdldCA9IGNtZCA/
IGNtZCA6IHNzaXU7CiAJfQogCisJaWYgKG1vZCA9PSBzc2l1KQorCQlpZCA9IHJzbmRfbW9kX2lk
X3N1Yihtb2QpOworCiAJLyogTm9uIHRhcmdldCBtb2Qgb3Igbm9uIDE2Yml0IG5lZWRzIG5vcm1h
bCBEQUxJR04gKi8KIAlpZiAoKHNuZF9wY21fZm9ybWF0X3dpZHRoKHJ1bnRpbWUtPmZvcm1hdCkg
IT0gMTYpIHx8CiAJICAgIChtb2QgIT0gdGFyZ2V0KSkKLQkJcmV0dXJuIDB4NzY1NDMyMTA7CisJ
CWludiA9IDA7CiAJLyogVGFyZ2V0IG1vZCBuZWVkcyBpbnZlcnRlZCBEQUxJR04gd2hlbiAxNmJp
dCAqLwogCWVsc2UKLQkJcmV0dXJuIDB4Njc0NTIzMDE7CisJCWludiA9IDE7CisKKwlyZXR1cm4g
ZGFsaWduX3ZhbHVlc1tpZF1baW52XTsKIH0KIAogdTMyIHJzbmRfZ2V0X2J1c2lmX3NoaWZ0KHN0
cnVjdCByc25kX2RhaV9zdHJlYW0gKmlvLCBzdHJ1Y3QgcnNuZF9tb2QgKm1vZCkKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1k
ZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFp
bG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
