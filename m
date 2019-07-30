Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B73E27BD32
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 11:31:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4A0D1716;
	Wed, 31 Jul 2019 11:30:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4A0D1716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564565488;
	bh=XHjsiI2pbUM4fTSVWCmomVMHb1ktIY4O3RijXALNZyo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G6P0BiWJLszww46OM5qDEBpuRTyf4aQNeWVVlAi3IZDW53l9V1XakLcGF3+XMDSZt
	 Z2mkDgSyim434YaLNofhhQbq6x+cclV23+VOg+DL239gKePbDy3/qwwFMEKsXs5QCl
	 oqNr9OUJHFdg3N+1gVEPMluMOaPvrKgtKTJLNROs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB169F805E0;
	Wed, 31 Jul 2019 11:26:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB0BFF804CA; Tue, 30 Jul 2019 20:16:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29393F80482
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 20:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29393F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="nn4jyTto"
Received: by mail-pg1-x544.google.com with SMTP id i70so19737618pgd.4
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 11:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=drpvbwUEmUOqA3rSa/EHTjOXz8bDuvvIlVQlOazqbgk=;
 b=nn4jyTtoTH9EMFWnV9qKEVgmKzU6j7rTN7ZN81N8sybrrR929M2kyR8mWylfC5gGIf
 bu5GBll3oHbvOyBmuQu+k7OVAvIQlaQ3I2+3kCQhOQlP61Y+XxlbSeyZi1Az2wTEt7aW
 jzN6RM4Zk6JorcmqOmzg2N6UBzSygP63SU10I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=drpvbwUEmUOqA3rSa/EHTjOXz8bDuvvIlVQlOazqbgk=;
 b=o5S0IQfRF8IHbVgz3E1ULqNAzAM1s3CVbZu2Zq5WwoB6Moxi9F2ZdPT0ZS7f0Da6f/
 bdNSFXRNcYX2fFt+1qWnkNrYMsDgIefGBC/ax5AJ95QZ17P+35hMTwQv/Y3wnNTFcOmV
 xDaJM2vsEhMQMVGoJLy+4bCW+AEeHl+/YWLav+6NKxGGQBY+h8n2no1wc10HaX06L3xb
 AryezLlYMJ8xfDGLzwmGiF6KUEW/xClEhOyK2R0lCfdXwm8nSvVW6wMRiTBjuSVARIKW
 IvFGPBPsYeHsgXgOspbzvYKJsGOnPY8bWOpUbmzilBlRaGMnqFUm8T36/XddDUcMyPxe
 h4Ew==
X-Gm-Message-State: APjAAAXC0+qa/LW5sokKMJZCMACB6nLNXZf6cRY7JWMY6GRXnVR3QNqb
 5CDlsev3spQT/Iohx46BbF/WTQ==
X-Google-Smtp-Source: APXvYqxN5aOtZPn1fNcdcsOE/IvEp6rYADNvu5y7Uo8PjkknLasyDwZtavI+yaiFRABIEE/tUaqmHA==
X-Received: by 2002:a63:e54f:: with SMTP id z15mr109671681pgj.4.1564510606703; 
 Tue, 30 Jul 2019 11:16:46 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id g1sm106744083pgg.27.2019.07.30.11.16.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 11:16:46 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue, 30 Jul 2019 11:15:57 -0700
Message-Id: <20190730181557.90391-58-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190730181557.90391-1-swboyd@chromium.org>
References: <20190730181557.90391-1-swboyd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Jul 2019 11:19:39 +0200
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Colin Ian King <colin.king@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [alsa-devel] [PATCH v6 57/57] ALSA: x86: Remove dev_err() usage
	after platform_get_irq()
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

V2UgZG9uJ3QgbmVlZCBkZXZfZXJyKCkgbWVzc2FnZXMgd2hlbiBwbGF0Zm9ybV9nZXRfaXJxKCkg
ZmFpbHMgbm93IHRoYXQKcGxhdGZvcm1fZ2V0X2lycSgpIHByaW50cyBhbiBlcnJvciBtZXNzYWdl
IGl0c2VsZiB3aGVuIHNvbWV0aGluZyBnb2VzCndyb25nLiBMZXQncyByZW1vdmUgdGhlc2UgcHJp
bnRzIHdpdGggYSBzaW1wbGUgc2VtYW50aWMgcGF0Y2guCgovLyA8c21wbD4KQEAKZXhwcmVzc2lv
biByZXQ7CnN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKkU7CkBACgpyZXQgPQooCnBsYXRmb3JtX2dl
dF9pcnEoRSwgLi4uKQp8CnBsYXRmb3JtX2dldF9pcnFfYnluYW1lKEUsIC4uLikKKTsKCmlmICgg
XCggcmV0IDwgMCBcfCByZXQgPD0gMCBcKSApCnsKKAotaWYgKHJldCAhPSAtRVBST0JFX0RFRkVS
KQoteyAuLi4KLWRldl9lcnIoLi4uKTsKLS4uLiB9CnwKLi4uCi1kZXZfZXJyKC4uLik7CikKLi4u
Cn0KLy8gPC9zbXBsPgoKV2hpbGUgd2UncmUgaGVyZSwgcmVtb3ZlIGJyYWNlcyBvbiBpZiBzdGF0
ZW1lbnRzIHRoYXQgb25seSBoYXZlIG9uZQpzdGF0ZW1lbnQgKG1hbnVhbGx5KS4KCkNjOiBKYXJv
c2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6PgpDYzogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNl
LmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogR3Jl
ZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IFRob21hcyBH
bGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogIlZpbGxlIFN5cmrDpGzDpCIgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdA
Y2Fub25pY2FsLmNvbT4KQ2M6IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpDYzogR3JlZyBL
cm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KU2lnbmVkLW9mZi1ieTog
U3RlcGhlbiBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3JnPgotLS0KClBsZWFzZSBhcHBseSBkaXJl
Y3RseSB0byBzdWJzeXN0ZW0gdHJlZXMKCiBzb3VuZC94ODYvaW50ZWxfaGRtaV9hdWRpby5jIHwg
NCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvc291bmQveDg2L2ludGVsX2hkbWlfYXVkaW8uYyBiL3NvdW5kL3g4Ni9pbnRl
bF9oZG1pX2F1ZGlvLmMKaW5kZXggNWZkNGUzMjI0N2E2Li5jZDM4OWQyMTIxOWEgMTAwNjQ0Ci0t
LSBhL3NvdW5kL3g4Ni9pbnRlbF9oZG1pX2F1ZGlvLmMKKysrIGIvc291bmQveDg2L2ludGVsX2hk
bWlfYXVkaW8uYwpAQCAtMTcwOCwxMCArMTcwOCw4IEBAIHN0YXRpYyBpbnQgaGRtaV9scGVfYXVk
aW9fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCS8qIGdldCByZXNvdXJj
ZXMgKi8KIAlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwotCWlmIChpcnEgPCAwKSB7
Ci0JCWRldl9lcnIoJnBkZXYtPmRldiwgIkNvdWxkIG5vdCBnZXQgaXJxIHJlc291cmNlOiAlZFxu
IiwgaXJxKTsKKwlpZiAoaXJxIDwgMCkKIAkJcmV0dXJuIGlycTsKLQl9CiAKIAlyZXNfbW1pbyA9
IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7CiAJaWYgKCFy
ZXNfbW1pbykgewotLSAKU2VudCBieSBhIGNvbXB1dGVyIHRocm91Z2ggdHViZXMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
