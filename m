Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B009D49A8
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 23:07:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D0E21671;
	Fri, 11 Oct 2019 23:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D0E21671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570828027;
	bh=S6yct1GUHL0MaupZ+Mcymmyx79iMtfwAsZNwqjR/LLo=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZeN490QPTeOCkBDeJHHz4J9dZhhsLtGbzHWTWen6i4QH80fRnh4ivdQPP2xu8gL9K
	 +TCx0E5Eo+lvHOrTMrTSmWgl17O08IglmRiuBTWDGyNcVsZjeW0Fun8Xhgpq82leXB
	 rp9UjHLUH1r/hZ1n6N1SXYE9lvIPFb7oLyVlI1lc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98A63F802BD;
	Fri, 11 Oct 2019 23:05:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C05FF802BE; Fri, 11 Oct 2019 23:05:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70F2EF80113
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 23:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70F2EF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jO0f7w4T"
Received: by mail-wm1-x334.google.com with SMTP id 7so11701507wme.1
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 14:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=jA6dfJWqr0dJgDD2s+9+iGGdyjYB0avPNXoMgPLkvnE=;
 b=jO0f7w4TOC06sDI8te1eEmKojRDHRG2AKBcFH/7JfQQ0OTLmHHKO895SdMrbUvTySd
 9lET9GBxKwrrLHglSap4VfoOMpgepbmz+UNz9tCdMG41kqAerg3wqWK2j5gRzFwWR7+r
 2z7fa0NX9WLjZ1My+URjNYnUF+UlMAj/ObBHswNHskt+nEsK5btLgbQhj2i0skExeYMR
 6Mm0SJYxk7oXlBRXwzX3229QZN5X2AmlGiM3iWtn1k5huOzZN7sO9sk6WzXR9rFdU7go
 jhUN45eMheSHX2m1iElzMm2tfiL8N/uousDRQjc22xXPpz7wPYx+yIw3PIXGnc7AgDqK
 gwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=jA6dfJWqr0dJgDD2s+9+iGGdyjYB0avPNXoMgPLkvnE=;
 b=nqSZRpLyX4vayAsvaId5Py5V0YavitH+hFDCjHEGsN5ZSkAEQyQm2sW7iyTH0kxKZU
 LXB79YnLKB9ZoAZhi1iwFCsNE1v1XpyMg3t0T7r7pdXOVUO/x4FXtv7WBKUcpJYnLnkA
 O77/Ar8DEKO05oDbEWSxfhhvBwbGSLutB4yL7i7/9LJa78H20JK65DNRDU7bookkeJm5
 mQw0kRe6fsoW4cZS96DkFxYWF1fY6RmfM4Loqvu6SOXJpCMWahLVFQyCaktAGQMkpYnS
 lrJy7K31rWrmct2kcXJ0ZoRRzIO5YWcJQBMrxTBZHXFhj59sx5BIg5AbWLJsv1vAQfGU
 LU2w==
X-Gm-Message-State: APjAAAWWt5hinjz21TRJh7CKp19MzSILruFHZkoVayeINLIxD3KVKkY4
 POPTbN9mvSmBPgSTqjNtFyZ0xaI+xa1gUqOtBZk=
X-Google-Smtp-Source: APXvYqwwR16BWzDaAQdj18EwQcW1QMM6zqb8OWy376Z5AQ1ScvVjMFkTX84URhUQqc/33uixneB1tf8mR2ARBj2Espo=
X-Received: by 2002:a1c:7dce:: with SMTP id y197mr4612866wmc.171.1570827915260; 
 Fri, 11 Oct 2019 14:05:15 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Sat, 12 Oct 2019 00:05:03 +0300
Message-ID: <CAEnQRZAen_Aa7SMdnPY4ezzbYtUypShto7ENGV_FhnsNhnxmBQ@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>
Subject: [alsa-devel] Question about FE & BE DPCM
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

SGkgTW9yaW1vdG8tc2FuLAoKSSdtIHJlYWxseSBjb25mdXNlZCBvbiB3aGF0IGV4YWN0bHkgaXMg
RnJvbnQgRW5kIGFuZCBCYWNrIEVuZC4KCklzIEZFIGEgREFJIG9yIGEgREFJIGxpbmsgb3IgcGFy
dCBvZiBhIERBSSBsaW5rPwoKSW4gc2ltcGxlLWNhcmQuYyB0aGVyZSBpcyBzaW1wbGVfZGFpX2xp
bmtfb2ZfZHBjbSBmdW5jdGlvbjoKCnN0cnVjdCBzbmRfc29jX2RhaV9saW5rX2NvbXBvbmVudCAq
Y29kZWNzID0gZGFpX2xpbmstPmNvZGVjczsKCsK7ICAgICAgIC8qIEJFIGlzIGR1bW15ICovCsK7
ICAgICAgIMK7ICAgICAgIGNvZGVjcy0+b2Zfbm9kZcK7wrsgICAgICAgPSBOVUxMOwrCuyAgICAg
ICDCuyAgICAgICBjb2RlY3MtPmRhaV9uYW1lwrsgICAgICAgPSAic25kLXNvYy1kdW1teS1kYWki
OwrCuyAgICAgICDCuyAgICAgICBjb2RlY3MtPm5hbWXCuyAgIMK7ICAgICAgID0gInNuZC1zb2Mt
ZHVtbXkiOwoKwrsgICAgICAgwrsgICAgICAgLyogRkUgc2V0dGluZ3MgKi8KwrsgICAgICAgwrsg
ICAgICAgZGFpX2xpbmstPmR5bmFtaWPCuyAgICAgIMK7ICAgICAgID0gMTsKwrsgICAgICAgwrsg
ICAgICAgZGFpX2xpbmstPmRwY21fbWVyZ2VkX2Zvcm1hdMK7ICAgPSAxOwoKU28sIGZyb20gaGVy
ZSBpdCBsb29rcyBsaWtlIEJFL0ZFIGFyZSBjb21wb25lbnRzIGJlaW5nIHBhcnQgb2YgdGhlIHNh
bWUgbGluay4KCkFub3RoZXIgdGhpbmcgaXM6Cgphc29jX3NpbXBsZV9jYW5vbmljYWxpemVfcGxh
dGZvcm0gZnVuY3Rpb24gd2hlcmUgaXQgZG9lcyBzYXk6CgrCuyAgICAgICAgKiBEUENNIEJFIGNh
biBiZSBubyBwbGF0Zm9ybS4KwrsgICAgICAgICogQWxsb2NlZCBtZW1vcnkgd2lsbCBiZSB3YXN0
ZSwgYnV0IG5vdCBsZWFrLgrCuyAgICAgICAgKi8KwrsgICAgICAgaWYgKCFkYWlfbGluay0+cGxh
dGZvcm1zLT5vZl9ub2RlKQrCuyAgICAgICDCuyAgICAgICBkYWlfbGluay0+bnVtX3BsYXRmb3Jt
cyA9IDA7CgpCdXQgSSBkbyB3YW50IHRvIGNyZWF0ZSBhIEJFIHdpdGggYSBwbGF0Zm9ybS4gU28s
IHNob3VsZCBJIHRyeSB0bwpyZXZlcnQgdGhlIGZvbGxvd2luZwpwYXRjaDoKCmNvbW1pdCA3OTRm
Y2VlOGRhM2MwYzhhMDFiMDhlY2FkMWMxODFjYjBhNjIyODY4CkF1dGhvcjogS3VuaW5vcmkgTW9y
aW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgpEYXRlOiAgIFdlZCBKdWwg
MTAgMTc6MDE6MTIgMjAxOSArMDkwMAoKICAgIEFTb0M6IHNpbXBsZS1jYXJkLXV0aWxzOiBjYXJl
IG5vIFBsYXRmb3JtIGZvciBEUENNCgogICAgY29tbWl0IDM0NjE0NzM5OTg4YWQgKCJBU29DOiBz
b2MtY29yZTogc3VwcG9ydCBkYWlfbGluayB3aXRoCiAgICBwbGF0Zm9ybXNfbnVtICE9IDEiKSBz
dXBwb3J0cyBtdWx0aSBQbGF0Zm9ybSwgYW5kCiAgICBjb21taXQgOWYzZWI5MTc1MzQ1MSAoIkFT
b0M6IHNpbXBsZS1jYXJkLXV0aWxzOiBjb25zaWRlciBDUFUtUGxhdGZvcm0KICAgIHBvc3NpYmls
aXR5IikgcmVtb3ZlZCBubyBQbGF0Zm9ybSBmcm9tIHNpbXBsZS1jYXJkLgoKICAgIE11bHRpIFBs
YXRmb3JtIGlzIG5vdyBjaGVja2luZyBib3RoIFBsYXRmb3JtIG5hbWUvb2Zfbm9kZSBhcmUgTlVM
TCBjYXNlLgogICAgQnV0IGluIG5vcm1hbCBjYXNlLCBEUENNIGJlIGRvZXNuJ3QgaGF2ZSBQbGF0
Zm9ybS4KCgoKQmFzaWNhbGx5LCB3aGF0IEkgd2FudCB0byBkbyBpczogYWZ0ZXIgdGhlIERBSSBs
aW5rIGlzIGNyZWF0ZWQgdG8gY2FsbDoKc25kX3NvY19maXh1cF9kYWlfbGlua3NfcGxhdGZvcm1f
bmFtZSBmdW5jdGlvbiB0byBzZXQgYSBwcm9wZXIgbmFtZQpmb3IgQkUgcGxhdGZvcm0uCgpUaGUg
cHJvYmxlbSBpcyB0aGF0IGFib3ZlIG1lbnRpb25lZCBwYXRjaCBzZXRzIGRhaV9saW5rLT5udW1f
cGxhdGZvcm1zID0gMDsKc28gZXZlbiB0aGUgbmFtZSBpcyBzZXQgdGhlIHBsYXRmb3JtIGNvbXBv
bmVudCBpcyBub3QgcHJvYmVkLgoKdGhhbmtzLApEYW5pZWwuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
