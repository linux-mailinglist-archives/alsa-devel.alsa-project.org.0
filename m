Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 084D6F24E9
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 03:07:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9551D1693;
	Thu,  7 Nov 2019 03:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9551D1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573092426;
	bh=Z0/ywSmaeXyTwP4FSJAjJ+rQNe4jvXXvCf+ECcwXeOc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nLMkW71TKR/MyC8g8gwl1HFeIMVhUUOjf7N1gMV+HAAIT21IWQ9V15uIE6NE+awH5
	 ZMO6kTAe50xNQGzv34Dc7RMIvob2w93aBjUm54cI6N6qp0BBVYwFiZlU2laaFNs9Ku
	 BxF5TrVLtlCj1shm2dg9IEAaZnsdMNsZ7OfumRfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C3F6F8070B;
	Thu,  7 Nov 2019 02:58:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ADFCF8064C; Thu,  7 Nov 2019 02:58:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1DC2F8060F
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 02:58:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1DC2F8060F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ElLE5SmO"
Received: by mail-pg1-x543.google.com with SMTP id 15so716318pgt.7
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 17:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ox0AO9kWgLrhLk18Ku0peTzE0vVN9WNb0eNmf4Xm75Y=;
 b=ElLE5SmOCXH03H0i0V6LdXEQOdrOzxB8GZglJhPjJujcjQBM8Zt7WX+DmEsOgpqZEB
 BVgyN0yDQgLIWnApYqvjJVvyD41msn52iQb2LqoSZQI918HgePH8tFnQVvxl0MifgHGr
 snOMDjKB+yALeUejXTT+N+im5Xszt9gg+45aQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ox0AO9kWgLrhLk18Ku0peTzE0vVN9WNb0eNmf4Xm75Y=;
 b=oIWjwuSZSL7VJrtaTs7AjSWPiFMx6Pi+31O1LgUs+hNuQdXOf/4oXh9dfBo3njJdzO
 wIk8xAmPyrnTb8fo9RNE8kkDZ26hyeMQX+pUkK7Wn6G/vmKHncT5k85K4Op0riGjPHOT
 ekN/vdj0sPbKBl/jHaQUz4M0rRA/2fEH8zSL8VFJmcT1FphzDXkS1d16TvbSJDb4wthn
 bre9XR1nq3EpuRs4jS3kn8TjRdrIrQdRApNHWjEBBY+hl2XPCFPNOnPG+gGgoZaWmjmj
 FrKJvR7Dh/YT0c0KHz+NrEUVlCkioclQQA3vfyegGhKuq6scLGKHN/8xmyESd9aqOqwi
 yBsg==
X-Gm-Message-State: APjAAAVoMwso7QXIKlK4HRDQ4WX5cL3AevvNMBB9exDVXiEmjnqRz3NJ
 fBzlsFZyW0OGwE9Wp2+8oCva+9HBdoZj
X-Google-Smtp-Source: APXvYqyqJpjd23xYJtB0fhy2gtuWL4CCkndVDu4c0bssy+EKWYItYc/yjZikeaQAFU6YjOtP5A46Gg==
X-Received: by 2002:a17:90a:fd88:: with SMTP id
 cx8mr1524712pjb.88.1573091921997; 
 Wed, 06 Nov 2019 17:58:41 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id p16sm296682pfn.171.2019.11.06.17.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 17:58:41 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 17:58:08 -0800
Message-Id: <20191107015808.26844-11-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191107015808.26844-1-cujomalainey@chromium.org>
References: <20191107015808.26844-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Curtis Malainey <cujomalainey@chromium.org>, broonie@kernel.org
Subject: [alsa-devel] [PATCH 11/11] ucm: docs: Add DefaultNodeGain
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

QWxsb3cgdWNtIHRvIHNwZWNpZnkgYSBkZWZhdWx0IGhhcmR3YXJlIGdhaW4gdG8gb3ZlcmlkZSBv
biB0aGUgcmVzcGVjdGl2ZSBub2RlLgoKU2lnbmVkLW9mZi1ieTogQ3VydGlzIE1hbGFpbmV5IDxj
dWpvbWFsYWluZXlAY2hyb21pdW0ub3JnPgotLS0KIGluY2x1ZGUvdXNlLWNhc2UuaCB8IDIgKysK
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3Vz
ZS1jYXNlLmggYi9pbmNsdWRlL3VzZS1jYXNlLmgKaW5kZXggZWU2ZWU1ZTAuLmQwZTgyMWQ1IDEw
MDY0NAotLS0gYS9pbmNsdWRlL3VzZS1jYXNlLmgKKysrIGIvaW5jbHVkZS91c2UtY2FzZS5oCkBA
IC0zNDcsNiArMzQ3LDggQEAgaW50IHNuZF91c2VfY2FzZV9nZXRfbGlzdChzbmRfdXNlX2Nhc2Vf
bWdyX3QgKnVjX21nciwKICAqICAgLSBTb2Z0d2FyZUdhaW4KICAqICAgICAgLSBTcGVjaWZ5IHRo
ZSBzb2Z0d2FyZSBnYWluIGluIDAuMDFkQi4gRS5nLiAiMjAiIG1lYW5zIHRoZXJlIHdpbGwgYmUK
ICAqICAgICAgICAwLjIgZEIgc29mdHdhcmUgZ2FpbiBvbiB0aGlzIG5vZGUuCisgKiAgIC0gRGVm
YXVsdE5vZGVHYWluCisgKiAgICAgIC0gQ2hhbmdlIHRoZSBkZWZhdWx0IG5vZGUgZ2Fpbi4gRS5n
OiDigJwtNzAw4oCdIHRvIHNldCAtNyBkQiBvbiB0aGlzIG5vZGUKICAqICAgLSBEaXNhYmxlU29m
dHdhcmVWb2x1bWUKICAqICAgICAgLSBTZXQgdG8gIjEiIHRvIGZvcmNlIHVzZXJzcGFjZSB0byB1
c2UgaGFyZHdhcmUgdm9sdW1lIGNvbnRyb2xzCiAgKi8KLS0gCjIuMjQuMC40MzIuZzlkM2Y1ZjVi
NjMtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
