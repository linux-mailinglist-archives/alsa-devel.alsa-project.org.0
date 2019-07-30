Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6517679E51
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 03:51:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDD8617F8;
	Tue, 30 Jul 2019 03:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDD8617F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564451498;
	bh=yZDp+6UDe/Feqj+ycS6ySC3n0AaYmJ9W1kGxf+y2XmU=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jU2PPViuGpofo1EpxJ3kdAqOaE2pPbU+rlOazw7oRK6TY538f3KFqxYZZbzbHQWtx
	 yw7IlIXVMqE2N/81s8Bi4jz56ZSBqMh0/xR8NCTCBS8hPWszWXFSDacU0C11LoGyzr
	 mcYvgivMe+h5NguOTqkBzGHlJTOCPEGfCcWQe7YM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7C2BF804CC;
	Tue, 30 Jul 2019 03:49:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E947F804CA; Tue, 30 Jul 2019 03:49:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_RP_RNBL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from gateway24.websitewelcome.com (gateway24.websitewelcome.com
 [192.185.51.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F3B9F800AB
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 03:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F3B9F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com
 header.b="woXdxnVN"
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway24.websitewelcome.com (Postfix) with ESMTP id 4E8504F0B
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 20:49:46 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id sHGsh3qJH2qH7sHGsh6B1s; Mon, 29 Jul 2019 20:49:46 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=THMhZ3Z9UJJLl14GwuPwJ19Y8ZFPT6dx5E0Ehq+rKsk=; b=woXdxnVNQCm+KQCOv+3gvr4h7D
 6d4HVNgIHdRa43w/l7B3jIgUjpKSz6SBRm15c29pVGlCR6fwZ41WLTXkfEZOObhXKE7O79DiPFJ49
 3cYYXGFmc/r3Agl6S48wB7SbjFfIwjCYLJXgSjKpNbidaA1CDcaWyKSjykwwneaOgW3P2F+LPoZGk
 paap30gIBvJ9EbKG2siWyQC2ctXSFKq9IkY1acbAbFT1XChWs4n0K89seG+8sxEzOTvAJEzFgquHw
 GCWB/4FTHLImorxUQ1mHMU8wpauRWabn/BWFPKE43IupzPv85nGioNW11g7BqJ2fyQrc/iB/DbKxp
 UL/H3d/Q==;
Received: from [187.192.11.120] (port=37264 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hsHGq-003dAx-V6; Mon, 29 Jul 2019 20:49:45 -0500
Date: Mon, 29 Jul 2019 20:49:44 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Message-ID: <20190730014944.GA31900@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hsHGq-003dAx-V6
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:37264
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [alsa-devel] [PATCH] ALSA: sparc: Mark expected switch fall-throughs
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

TWFyayBzd2l0Y2ggY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2gu
CgpUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZ3MgKEJ1aWxkaW5nOiBzcGFy
YzY0KToKCnNvdW5kL3NwYXJjL2RicmkuYzogSW4gZnVuY3Rpb24g4oCYcmV2ZXJzZV9ieXRlc+KA
mToKc291bmQvc3BhcmMvZGJyaS5jOjU4Mjo1OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkg
ZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KICAgYiA9ICgoYiAmIDB4ZmZm
ZjAwMDApID4+IDE2KSB8ICgoYiAmIDB4MDAwMGZmZmYpIDw8IDE2KTsKICAgfn5efn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpzb3VuZC9zcGFyYy9k
YnJpLmM6NTgzOjI6IG5vdGU6IGhlcmUKICBjYXNlIDE2OgogIF5+fn4Kc291bmQvc3BhcmMvZGJy
aS5jOjU4NDo1OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2lt
cGxpY2l0LWZhbGx0aHJvdWdoPV0KICAgYiA9ICgoYiAmIDB4ZmYwMGZmMDApID4+IDgpIHwgKChi
ICYgMHgwMGZmMDBmZikgPDwgOCk7CiAgIH5+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+CnNvdW5kL3NwYXJjL2RicmkuYzo1ODU6Mjogbm90ZTogaGVy
ZQogIGNhc2UgODoKICBefn5+CnNvdW5kL3NwYXJjL2RicmkuYzo1ODY6NTogd2FybmluZzogdGhp
cyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCiAg
IGIgPSAoKGIgJiAweGYwZjBmMGYwKSA+PiA0KSB8ICgoYiAmIDB4MGYwZjBmMGYpIDw8IDQpOwog
ICB+fl5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpz
b3VuZC9zcGFyYy9kYnJpLmM6NTg3OjI6IG5vdGU6IGhlcmUKICBjYXNlIDQ6CiAgXn5+fgpzb3Vu
ZC9zcGFyYy9kYnJpLmM6NTg4OjU6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRo
cm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQogICBiID0gKChiICYgMHhjY2NjY2NjYykg
Pj4gMikgfCAoKGIgJiAweDMzMzMzMzMzKSA8PCAyKTsKICAgfn5efn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4Kc291bmQvc3BhcmMvZGJyaS5jOjU4OToy
OiBub3RlOiBoZXJlCiAgY2FzZSAyOgogIF5+fn4KClNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4g
Ui4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Ci0tLQogc291bmQvc3BhcmMvZGJyaS5j
IHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
c291bmQvc3BhcmMvZGJyaS5jIGIvc291bmQvc3BhcmMvZGJyaS5jCmluZGV4IDAxMDExMzE1NjIz
OS4uNmUwNjVkNDQwNjBlIDEwMDY0NAotLS0gYS9zb3VuZC9zcGFyYy9kYnJpLmMKKysrIGIvc291
bmQvc3BhcmMvZGJyaS5jCkBAIC01ODAsMTIgKzU4MCwxNiBAQCBzdGF0aWMgX191MzIgcmV2ZXJz
ZV9ieXRlcyhfX3UzMiBiLCBpbnQgbGVuKQogCXN3aXRjaCAobGVuKSB7CiAJY2FzZSAzMjoKIAkJ
YiA9ICgoYiAmIDB4ZmZmZjAwMDApID4+IDE2KSB8ICgoYiAmIDB4MDAwMGZmZmYpIDw8IDE2KTsK
KwkJLyogZmFsbCB0aHJvdWdoICovCiAJY2FzZSAxNjoKIAkJYiA9ICgoYiAmIDB4ZmYwMGZmMDAp
ID4+IDgpIHwgKChiICYgMHgwMGZmMDBmZikgPDwgOCk7CisJCS8qIGZhbGwgdGhyb3VnaCAqLwog
CWNhc2UgODoKIAkJYiA9ICgoYiAmIDB4ZjBmMGYwZjApID4+IDQpIHwgKChiICYgMHgwZjBmMGYw
ZikgPDwgNCk7CisJCS8qIGZhbGwgdGhyb3VnaCAqLwogCWNhc2UgNDoKIAkJYiA9ICgoYiAmIDB4
Y2NjY2NjY2MpID4+IDIpIHwgKChiICYgMHgzMzMzMzMzMykgPDwgMik7CisJCS8qIGZhbGwgdGhy
b3VnaCAqLwogCWNhc2UgMjoKIAkJYiA9ICgoYiAmIDB4YWFhYWFhYWEpID4+IDEpIHwgKChiICYg
MHg1NTU1NTU1NSkgPDwgMSk7CiAJY2FzZSAxOgotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApB
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
