Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 767BA3D713B
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 10:32:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1685A1DF4;
	Tue, 27 Jul 2021 10:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1685A1DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627374739;
	bh=bpnnTCAOZXYR/ahVUTLu8Kh7lZ/41Mrlx2hq6aZlQ5g=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=ivRfoaUtqJ86wB27H60DzMkiiyI3qPruNp66dS2Nz9wu/VuXMK3S2RQKOq29hhBd1
	 y4oB5NYaygH50cFeeU+kH6E0C6UqqvHQ1y+5VbRCNLI6UCZh1kFZ+dBGnjr0qkevSo
	 jcrZIXv/2KgUJpQnQ5fsTDgjlAm0trbeXLQm8ZxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88DE8F804E4;
	Tue, 27 Jul 2021 10:29:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79618F8025A; Mon, 26 Jul 2021 08:38:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 536DAF8020D
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 08:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 536DAF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="CGzqPaR5"
Date: Mon, 26 Jul 2021 06:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1627281473;
 bh=pUijLgOUB/oFELisLkBXvEdSEe4CkElRAeuD8g7f1fw=;
 h=Date:To:From:Reply-To:Subject:From;
 b=CGzqPaR5HnpKlPnN/6fk+ATY6NvBP0rBYiO457nHCm7pmHrFCvQQ3LaRxhy7jWdzX
 QFnINyGGrZ7St4lxsv4EprGvTX6n8b9zcK1uMnsKMD1Q+FfTVnMFjuTiO0Sq1XqNXp
 ZVKBJ7LKpjHIAK4QEgEgFMyLN9TGtLIpED3BIzvc=
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Ryan McClue <re.mcclue@protonmail.com>
Subject: Intel HDA Driver Issue With PCM RW Interleaved
Message-ID: <Ku86LtfuLk75iQJb_s7DVAxjlOhldXkAV4wBG4bROaixMRleq2XwF8-x9xmi-eNQC8G1CP-RvfXNM5Cob3XPnKNcjXqaMAnRLMyTI8PWfZY=@protonmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 27 Jul 2021 10:29:09 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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
Reply-To: Ryan McClue <re.mcclue@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGksCkknbSB0cnlpbmcgdG8gcGxheSBhIHNpbXBsZSBQQ00gYnVmZmVyIHNpbmdsZSB0aHJlYWRl
ZCB3aXRob3V0IGJ1ZmZlciB1bmRlcnJ1bi4KUHJvZ3JhbSBzb3VyY2U6aHR0cHM6Ly9naXN0Lmdp
dGh1Yi5jb20vdGFrYXN3aWUvZDhhOTU1M2MyMzA5NzFkOTc0YTNkZmM3NTliMmZmNjcKKHN0cnVj
dCBzbmRfcGNtX3N3X3BhcmFtcykuc3RhcnRfdGhyZXNob2xkaXMgYWx0ZXJlZCBzbyBhcyB0byBh
bGxvdyBzcGVjaWZ5aW5nIHRoZSBzdGFydCBvZiBhdWRpbyBmcmFtZSB0cmFuc21pc3Npb24gYW5k
IHByZXZlbnQgdW5kZXJydW4gaXNzdWVzLgpJbiBteSBhcHBsaWNhdGlvbiwgb25pb2N0bChmZCwg
U05EUlZfUENNX0lPQ1RMX1NUQVRVUywgJnN0YXR1cyksIEkgcmVjZWl2ZTpGaWxlIGRlc2NyaXB0
b3IgaW4gYmFkIHN0YXRlCk91dHB1dCBvZiQoZG1lc2cpaXM6WyA2OS4wMTMwODRdIHNuZF9oZGFf
aW50ZWwgMDAwMDowMDoxZi4zOiBUb28gYmlnIGFkanVzdG1lbnQgMTI4CgpGcm9tIGEgcHJldmlv
dXMgcmVzcG9uc2Ugb24gdGhlYWxzYS1kZXZlbG1haWxpbmcgbGlzdDoKCj4gVGhlIGRyaXZlciBo
YXMgc29tZSBzbWFsbCBudW1iZXIgb2YgcGVyaW9kcyB0byBiZQo+IHB1dCBhdCB0aGUgYmVnaW5u
aW5nIG9mIHRoZSBidWZmZXIgZm9yIGNvcnJlY3RpbmcgdGhlIHJlcG9ydGVkCj4gcG9zaXRpb24u
IEp1ZGdpbmcgZnJvbSB0aGUgbWVzc2FnZSwgeW91IHNlZW0gdG8gaGF2ZSBzZXQgYSBxdWl0ZSBo
aWdoCj4gcmF0ZSBhbmQgYSB2ZXJ5IHNob3QgbnVtYmVyLCBhbmQgdGhhdCdzIHBvc3NpYmx5IHRv
byB0aWdodCB0byBvcGVyYXRlCj4gcHJvcGVybHkuCgpIb3dldmVyLCBJJ20gbm90IHN1cmUgd2hh
dCB0byBjaGFuZ2UgaW4gdGhpcyBjb2RlIHRvIGFkZHJlc3MgdGhpcyBpc3N1ZSBhbmQgZ2V0IGl0
IHRvIHdvcmsuIEkgdHJpZWQgYWx0ZXJpbmdNWV9QTEFZQkFDS19EVVJBVElPTmFuZHBhcmFtcy5z
dGFydF90aHJlc2hvbGRidXQgZ2V0IHRoZSBzYW1lIGVycm9yLgoKVGhlIHByb2dyYW0gZHVtcHMg
dGhlIGN1cnJlbnQgaGFyZHdhcmUgcGFyYW1ldGVyczoKCkN1cnJlbnQgaGFyZHdhcmUgcGFyYW1l
dGVyczoKICBDaGFuZ2VkIHBhcmFtZXRlcnM6CiAgICBhY2Nlc3MKICAgIGZvcm1hdAogICAgc3Vi
Zm9ybWF0CiAgICBzYW1wbGUtYml0cwogICAgZnJhbWUtYml0cwogICAgY2hhbm5lbHMKICAgIHJh
dGUKICAgIHBlcmlvZC10aW1lCiAgICBwZXJpb2Qtc2l6ZQogICAgcGVyaW9kLWJ5dGVzCiAgICBw
ZXJpb2RzCiAgICBidWZmZXItdGltZQogICAgYnVmZmVyLXNpemUKICAgIGJ1ZmZlci1ieXRlcwog
ICAgdGljay10aW1lCiAgUnVudGltZSBwYXJhbWV0ZXJzOgogICAgYWNjZXNzOgogICAgICByZWFk
d3JpdGUtaW50ZXJsZWF2ZWQKICAgIGZvcm1hdDoKICAgICAgczE2LWxlCiAgICBzdWJmb3JtYXQ6
CiAgICAgIHN0ZAogICAgc2FtcGxlLWJpdHM6CiAgICAgIFsxNiwgMTZdLCBpbnRlZ2VyLAogICAg
ZnJhbWUtYml0czoKICAgICAgWzMyLCAzMl0sIGludGVnZXIsCiAgICBjaGFubmVsczoKICAgICAg
WzIsIDJdLCBpbnRlZ2VyLAogICAgcmF0ZToKICAgICAgWzQ4MDAwLCA0ODAwMF0sIGludGVnZXIs
CiAgICBwZXJpb2QtdGltZToKICAgICAgKDY2NiwgNjY3KSwKICAgIHBlcmlvZC1zaXplOgogICAg
ICBbMzIsIDMyXSwgaW50ZWdlciwKICAgIHBlcmlvZHM6CiAgICAgIFszMiwgMzJdLCBpbnRlZ2Vy
LAogICAgYnVmZmVyLXRpbWU6CiAgICAgICgyMTMzMywgMjEzMzQpLAogICAgYnVmZmVyLXNpemU6
CiAgICAgIFsxMDI0LCAxMDI0XSwgaW50ZWdlciwKICAgIGJ1ZmZlci1ieXRlczoKICAgICAgWzQw
OTYsIDQwOTZdLCBpbnRlZ2VyLAogICAgdGljay10aW1lOgogICAgICBbMCwgMF0sIGludGVnZXIs
CiAgICBpbmZvOgogICAgICBtbWFwCiAgICAgIG1tYXAtdmFsaWQKICAgICAgaW50ZXJsZWF2ZWQK
ICAgICAgYmxvY2stdHJhbnNmZXIKICAgICAgcGF1c2UKICAgICAgc3luYy1zdGFydAogICAgICBu
by1wZXJpb2Qtd2FrZXVwCiAgICAgIGhhcy13YWxsLWNsb2NrCiAgICAgIGhhcy1saW5rLWF0aW1l
CiAgICAgIGhhcy1saW5rLXN5bmNocm9uaXplZC1hdGltZQogICAgICBtb3N0LXNpZ25pZmljYW50
LWJpdHM6ICAgIDE2CiAgICAgIHJhdGVfbnVtOiA0ODAwMAogICAgICByYXRlX2RlbjogMQoKVGhh
bmtz
