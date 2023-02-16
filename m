Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1CC699638
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 14:47:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A4C2EA6;
	Thu, 16 Feb 2023 14:46:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A4C2EA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676555228;
	bh=fk6CZ5W9X2c+QPejS3L3KOZcZMUzDQw3yUwcYGURSAU=;
	h=Date:Subject:References:To:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=h4T+ExgDitPCcNCrLNBxzJFtKHwc+6vaCspz+GdLCS9T1ajRS8LYygH0363CFVrjX
	 W9neTNuHSgDXjjg7xJe/yBa5zxLd1LX/FqPA48ExZVn9nFSJEmTH+zDxF0eZ5osc2Q
	 ar1RLI3S/0aGk6MyDFuDHvJhAbkR/v0lexcawXOc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 516ADF800E3;
	Thu, 16 Feb 2023 14:45:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE3AAF80171; Thu, 16 Feb 2023 14:45:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,MIME_HTML_ONLY,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 605A5F80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 14:45:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 605A5F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Qtvp88Q4
Received: by mail-wm1-x32d.google.com with SMTP id
 o19-20020a05600c379300b003e21af96703so483997wmr.2
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Feb 2023 05:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:to:content-language
         :references:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Er50dOhg4bzDciRCV4k8qaawBsfq9yme7lU0zDjkqcI=;
        b=Qtvp88Q4e0txrj8q1Kw7eSOXA24Yj1qqYec/wxgxsosuUJ3GQmbptNHODNB99K6cx8
         Z4p/ruDNxT67Crq39SPuekRFVWLlwvBfC1qITvni1xBnTMJ25iOpubr2BE5PoqOL7OwY
         5PGcsxcOan/pwBEUhUMzFuhfcVcG44AzzgjhzJy58p10312TYbEKyICBplcgnxi2xvd1
         JbyqqT+ZajZNKfJc9Yy/sO5vBgahIMsb/AFskjtdjZ6LhrhFsJa6sz2EAE5aStSw6OA2
         O2IBbZS9MotmLD6ISa06lu/vKq4Rhmp5jn28+b+stASVJ4AzestL112YIEwwm0yT15RG
         eDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:to:content-language
         :references:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Er50dOhg4bzDciRCV4k8qaawBsfq9yme7lU0zDjkqcI=;
        b=3wbNSKWlJLjUfvfOkhtjXW9hoikxcwdEtVnAXrdeil26Ynb+v9IfiEbgbwCCu8KZpG
         /m2GEFhi+BwdODXgEAB/AwVSmrgmGLNmfdx4V4FCJSBpQSAxsRFO93zlElGtdsAa3/IT
         YpU/yNctM2rA/vISkUchkzzQDLBXAqp6vKEKx788iVvDEqdNwyydoMJZrIR1d6rUJbh0
         +noAj5pFOvzo1v6lPvFE2CnX0cD/wXowwh79xhhapGMxUq364u9gSVjysG/0HpGtEgsw
         zAAAugxSvyMVVcS8EIAcWWKe86n1ZGVGhkK9Rf5CYU9T8fjOV1tqqCsOa52EziOEYwTY
         h+bg==
X-Gm-Message-State: AO0yUKXdtbFCssta98qiQtjVhY645HfQv1SJdGyvSvFNQrYZqElj/7+O
	4vlQ4A6qu3TSY/lywe2D1EEyTXtVjeA=
X-Google-Smtp-Source: 
 AK7set+d8E32ptwjVSe6ErvkEQe/0JUlXdWrk0BrrXl7oxn0AtX+xf2nsjgTzqvhY1RUBj/vAJFrkw==
X-Received: by 2002:a05:600c:4b29:b0:3e2:147f:ac16 with SMTP id
 i41-20020a05600c4b2900b003e2147fac16mr1392678wmp.10.1676555104451;
        Thu, 16 Feb 2023 05:45:04 -0800 (PST)
Received: from [192.168.11.11] (awyoung.plus.com. [81.174.138.22])
        by smtp.googlemail.com with ESMTPSA id
 s9-20020a05600c45c900b003e00c9888besm5935775wmo.30.2023.02.16.05.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 05:45:03 -0800 (PST)
Message-ID: <877b4a88-a30a-751d-8f8a-1e1eab0295ec@gmail.com>
Date: Thu, 16 Feb 2023 13:45:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Fwd: [PATCH] pcm_rate: fix hw_ptr boundary wrapping issue
References: <20230105153546.468288-1-consult.awy@gmail.com>
Content-Language: en-GB
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
From: Alan Young <consult.awy@gmail.com>
In-Reply-To: <20230105153546.468288-1-consult.awy@gmail.com>
X-Forwarded-Message-Id: <20230105153546.468288-1-consult.awy@gmail.com>
Message-ID-Hash: LMXYSJGT6WOKZCAVC7LSRWUZ64LNUIF7
X-Message-ID-Hash: LMXYSJGT6WOKZCAVC7LSRWUZ64LNUIF7
X-MailFrom: consult.awy@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LMXYSJGT6WOKZCAVC7LSRWUZ64LNUIF7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ICAgSGksIGRpZCB0aGlzIG9uZSBzbGlwIHBhc3Q/IEkgaGF2ZSBub3Qgc2VlIGFueSByZXNwb25z
ZS4gQWxhbi4KCiAgIC0tLS0tLS0tIEZvcndhcmRlZCBNZXNzYWdlIC0tLS0tLS0tCiAgIFN1Ympl
Y3Q6IFtQQVRDSF0gcGNtX3JhdGU6IGZpeCBod19wdHIgYm91bmRhcnkgd3JhcHBpbmcgaXNzdWUK
ICAgRGF0ZTogVGh1LCA1IEphbiAyMDIzIDE1OjM1OjQ2ICswMDAwCiAgIEZyb206IEFsYW4gWW91
bmcgWzFdPGNvbnN1bHQuYXd5QGdtYWlsLmNvbT4KICAgVG86IFsyXWFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZwogICBDQzogWzNddGl3YWlAc3VzZS5kZSwgWzRdbWFoZW5kcmFuLmt1cHB1c2Ft
eUBpbi5ib3NjaC5jb20sIEFsYW4gWW91bmcKICAgWzVdPGNvbnN1bHQuYXd5QGdtYWlsLmNvbT4K
ICAgV3JhcCB0aGUgaHdfcHRyIHVzaW5nIHRoZSB0b3RhbCBwb3NpdGlvbiBvZiB0aGUgc2xhdmUg
aHdfcHRyLCBpbmNsdWRpbmcKICAgYm91bmRhcnkgd3JhcHMuIE90aGVyd2lzZSwgc21hbGwgZXJy
b3JzIGNhbiBjcmVlcCBpbiBkdWUgdG8gcmVzaWR1YWxzCiAgICh3aGVuIGJvdW5kYXJ5IGlzIG5v
dCBhIG11bHRpcGxlIG9mIHBlcmlvZCBzaXplKSBhbmQgd2hpY2ggY2FuCiAgIGFjY3VtdWxhdGUu
CiAgIFNpZ25lZC1vZmYtYnk6IEFsYW4gWW91bmcgWzZdPGNvbnN1bHQuYXd5QGdtYWlsLmNvbT4K
ICAgRml4ZXM6IDc1NzBlNWQ3ICgicGNtOiByYXRlOiBmaXggdGhlIGh3X3B0ciB1cGRhdGUgdW50
aWwgdGhlIGJvdW5kYXJ5CiAgIGF2YWlsYWJsZSIpCiAgIC0tLQogICBzcmMvcGNtL3BjbV9yYXRl
LmMgfCA1NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAg
IDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKICAgZGlm
ZiAtLWdpdCBhL3NyYy9wY20vcGNtX3JhdGUuYyBiL3NyYy9wY20vcGNtX3JhdGUuYwogICBpbmRl
eCBjODA3Njg1OS4uYTI5ZmM1YTkgMTAwNjQ0CiAgIC0tLSBhL3NyYy9wY20vcGNtX3JhdGUuYwog
ICArKysgYi9zcmMvcGNtL3BjbV9yYXRlLmMKICAgQEAgLTUyLDYgKzUyLDcgQEAgc3RydWN0IF9z
bmRfcGNtX3JhdGUgewogICBzbmRfcGNtX2dlbmVyaWNfdCBnZW47CiAgIHNuZF9wY21fdWZyYW1l
c190IGFwcGxfcHRyLCBod19wdHIsIGxhc3Rfc2xhdmVfaHdfcHRyOwogICBzbmRfcGNtX3VmcmFt
ZXNfdCBsYXN0X2NvbW1pdF9wdHI7CiAgICsgdV9pbnQ2NF90IHNsYXZlX2h3X3B0cl93cmFwOwog
ICBzbmRfcGNtX3VmcmFtZXNfdCBvcmlnX2F2YWlsX21pbjsKICAgc25kX3BjbV9zd19wYXJhbXNf
dCBzd19wYXJhbXM7CiAgIHNuZF9wY21fZm9ybWF0X3Qgc2Zvcm1hdDsKICAgQEAgLTU2Miw2ICs1
NjMsOCBAQCBzdGF0aWMgaW50IHNuZF9wY21fcmF0ZV9pbml0KHNuZF9wY21fdCAqcGNtKQogICBp
ZiAocmF0ZS0+b3BzLnJlc2V0KQogICByYXRlLT5vcHMucmVzZXQocmF0ZS0+b2JqKTsKICAgcmF0
ZS0+bGFzdF9jb21taXRfcHRyID0gMDsKICAgKyByYXRlLT5sYXN0X3NsYXZlX2h3X3B0ciA9IDA7
CiAgICsgcmF0ZS0+c2xhdmVfaHdfcHRyX3dyYXAgPSAwOwogICByYXRlLT5zdGFydF9wZW5kaW5n
ID0gMDsKICAgcmV0dXJuIDA7CiAgIH0KICAgQEAgLTYzOCwzMyArNjQxLDQ4IEBAIHNuZF9wY21f
cmF0ZV9yZWFkX2FyZWFzMShzbmRfcGNtX3QgKnBjbSwKICAgc3RhdGljIGlubGluZSB2b2lkIHNu
ZF9wY21fcmF0ZV9zeW5jX2h3cHRyMChzbmRfcGNtX3QgKnBjbSwKICAgc25kX3BjbV91ZnJhbWVz
X3Qgc2xhdmVfaHdfcHRyKQogICB7CiAgIHNuZF9wY21fcmF0ZV90ICpyYXRlOwogICAtIHNuZF9w
Y21fc2ZyYW1lc190IHNsYXZlX2h3X3B0cl9kaWZmOwogICAtIHNuZF9wY21fc2ZyYW1lc190IGxh
c3Rfc2xhdmVfaHdfcHRyX2ZyYWM7CiAgICsgc25kX3BjbV91ZnJhbWVzX3QgbmV3X2h3X3B0cjsK
ICAgKyBzbmRfcGNtX3VmcmFtZXNfdCBzbGF2ZV9yZXNpZHVhbDsKICAgaWYgKHBjbS0+c3RyZWFt
ICE9IFNORF9QQ01fU1RSRUFNX1BMQVlCQUNLKQogICByZXR1cm47CiAgIHJhdGUgPSBwY20tPnBy
aXZhdGVfZGF0YTsKICAgLSBzbGF2ZV9od19wdHJfZGlmZiA9IHBjbV9mcmFtZV9kaWZmKHNsYXZl
X2h3X3B0ciwKICAgcmF0ZS0+bGFzdF9zbGF2ZV9od19wdHIsIHJhdGUtPmdlbi5zbGF2ZS0+Ym91
bmRhcnkpOwogICAtIGlmIChzbGF2ZV9od19wdHJfZGlmZiA9PSAwKQogICArIGlmIChzbGF2ZV9o
d19wdHIgPT0gcmF0ZS0+bGFzdF9zbGF2ZV9od19wdHIpCiAgIHJldHVybjsKICAgLSBsYXN0X3Ns
YXZlX2h3X3B0cl9mcmFjID0gcmF0ZS0+bGFzdF9zbGF2ZV9od19wdHIgJQogICByYXRlLT5nZW4u
c2xhdmUtPnBlcmlvZF9zaXplOwogICAtIC8qIFdoaWxlIGhhbmRsaW5nIGZyYWN0aW9uIHBhcnQg
Zm8gc2xhdmUgcGVyaW9kLCByb3VuZGVkIHZhbHVlIHdpbGwKICAgYmUKICAgLSAqIGludHJvZHVj
ZWQgYnkgaW5wdXRfZnJhbWVzKCkuCiAgIC0gKiBUbyBlbGltaW5hdGUgcm91bmRpbmcgaXNzdWUg
b24gcmF0ZS0+aHdfcHRyLCBzdWJ0cmFjdCBsYXN0IHJvdW5kZWQKICAgLSAqIHZhbHVlIGZyb20g
cmF0ZS0+aHdfcHRyIGFuZCBhZGQgbmV3IHJvdW5kZWQgdmFsdWUgb2YgcHJlc2VudAogICAtICog
c2xhdmVfaHdfcHRyIGZyYWN0aW9uIHBhcnQgdG8gcmF0ZS0+aHdfcHRyLiBIZW5jZSwKICAgLSAq
IHJhdGUtPmh3X3B0ciArPSBbIChuby4gb2YgdXBkYXRlZCBzbGF2ZSBwZXJpb2RzICogcGNtIHJh
dGUgcGVyaW9kCiAgIHNpemUpIC0KICAgLSAqIGZyYWN0aW9uYWwgcGFydCBvZiBsYXN0X3NsYXZl
X2h3X3B0ciByb3VuZGVkIHZhbHVlICsKICAgLSAqIGZyYWN0aW9uYWwgcGFydCBvZiB1cGRhdGVk
IHNsYXZlIGh3IHB0cidzIHJvdW5kZWQgdmFsdWUgXQogICArCiAgICsgLyoKICAgKyAqIE91ciBo
d19wdHIgbWF5IHdyYXAgYXQgYSBkaWZmZXJlbnQgdGltZSB0byB0aGF0IG9mIHRoZSBzbGF2ZSBh
cyB0aGUKICAgKyAqIG51bWJlciBvZiBwZXJpb2QgLyBib3VuZGFyeSBtYXkgZGlmZmVyLiBJdCBp
cyBlc3NlbnRpYWwgdGhhdCBvdXIKICAgaHdfcHRyCiAgICsgKiB3cmFwcyBhdCB0aGUgY29ycmVj
dCBwb2ludCwgYWxvbmcgd2l0aCBvdXIgYXBwbF9wdHIuIE90aGVyd2lzZSB0aGUKICAgKyAqIGF2
YWlsIGNhbGN1bGF0aW9uIHdpbGwgYmUgaW5jb3JyZWN0LgogICArICoKICAgKyAqIFRyYWNrIHRo
ZSBudW1iZXIgb2Ygc2xhdmUgaHdfcHRyIGJvdW5kYXJ5IHdyYXBzIGFuZCB1c2UgdGhhdCB0bwog
ICBjYWxjdWxhdGUKICAgKyAqIG91ciBuZXdfaHdfcHRyIGZyb20gdGhlIHRvdGFsIG51bWJlciBv
ZiBzYW1wbGVzIGNvbnZlcnRlZC4KICAgKi8KICAgLSByYXRlLT5od19wdHIgKz0gKAogICAtICgo
KGxhc3Rfc2xhdmVfaHdfcHRyX2ZyYWMgKyBzbGF2ZV9od19wdHJfZGlmZikgLwogICByYXRlLT5n
ZW4uc2xhdmUtPnBlcmlvZF9zaXplKSAqIHBjbS0+cGVyaW9kX3NpemUpIC0KICAgLSByYXRlLT5v
cHMuaW5wdXRfZnJhbWVzKHJhdGUtPm9iaiwgbGFzdF9zbGF2ZV9od19wdHJfZnJhYykgKwogICAt
IHJhdGUtPm9wcy5pbnB1dF9mcmFtZXMocmF0ZS0+b2JqLCAobGFzdF9zbGF2ZV9od19wdHJfZnJh
YyArCiAgIHNsYXZlX2h3X3B0cl9kaWZmKSAlIHJhdGUtPmdlbi5zbGF2ZS0+cGVyaW9kX3NpemUp
KTsKICAgKyBpZiAoc2xhdmVfaHdfcHRyIDwgcmF0ZS0+bGFzdF9zbGF2ZV9od19wdHIpIHsKICAg
KyByYXRlLT5zbGF2ZV9od19wdHJfd3JhcCArPSByYXRlLT5nZW4uc2xhdmUtPmJvdW5kYXJ5Owog
ICArIH0KICAgcmF0ZS0+bGFzdF9zbGF2ZV9od19wdHIgPSBzbGF2ZV9od19wdHI7CiAgIC0gcmF0
ZS0+aHdfcHRyICU9IHBjbS0+Ym91bmRhcnk7CiAgICsgLyoKICAgKyAqIENhbGN1bGF0ZSByYXRl
LT5od19wdHIgdXNpbmcgdG90YWwgbnVtYmVyIG9mIGZyYW1lcyBjb25zdW1lZCBieQogICBzbGF2
ZSBod19wdHIsCiAgICsgKiBpbmNsdWRpbmcgYW55IGJvdW5kYXJ5IHdyYXBzLgogICArICovCiAg
ICsgaWYgKHJhdGUtPnNsYXZlX2h3X3B0cl93cmFwKSB7CiAgICsgLyoKICAgKyAqIFJlc3RyaWN0
IGV4cGxpY2l0IDY0LWJpdCBjYWxjdWxhdGlvbnMgdG8gY2FzZSB3aGVyZQogICByYXRlLT5zbGF2
ZV9od19wdHJfd3JhcAogICArICogaXMgbm9uLXplcm8sIHdoaWNoIHdpbGwgb25seSBoYXBwZW4g
aW4gMzItYml0IGVudmlyb25tZW50cy4KICAgKyAqLwogICArIHVfaW50NjRfdCB3cmFwcGVkX3Ns
YXZlX2h3X3B0ciA9IHNsYXZlX2h3X3B0ciArCiAgIHJhdGUtPnNsYXZlX2h3X3B0cl93cmFwOwog
ICArIG5ld19od19wdHIgPSAoKHdyYXBwZWRfc2xhdmVfaHdfcHRyIC8gcmF0ZS0+Z2VuLnNsYXZl
LT5wZXJpb2Rfc2l6ZSkgKgogICBwY20tPnBlcmlvZF9zaXplKSAlIHBjbS0+Ym91bmRhcnk7CiAg
ICsgc2xhdmVfcmVzaWR1YWwgPSB3cmFwcGVkX3NsYXZlX2h3X3B0ciAlIHJhdGUtPmdlbi5zbGF2
ZS0+cGVyaW9kX3NpemU7CiAgICsgfSBlbHNlIHsKICAgKyBuZXdfaHdfcHRyID0gKHNsYXZlX2h3
X3B0ciAvIHJhdGUtPmdlbi5zbGF2ZS0+cGVyaW9kX3NpemUpICoKICAgcGNtLT5wZXJpb2Rfc2l6
ZTsKICAgKyBzbGF2ZV9yZXNpZHVhbCA9IHNsYXZlX2h3X3B0ciAlIHJhdGUtPmdlbi5zbGF2ZS0+
cGVyaW9kX3NpemU7CiAgICsgfQogICArIG5ld19od19wdHIgKz0gcmF0ZS0+b3BzLmlucHV0X2Zy
YW1lcyhyYXRlLT5vYmosIHNsYXZlX3Jlc2lkdWFsKTsKICAgKyByYXRlLT5od19wdHIgPSBuZXdf
aHdfcHRyICUgcGNtLT5ib3VuZGFyeTsKICAgfQogICBzdGF0aWMgaW5saW5lIHZvaWQgc25kX3Bj
bV9yYXRlX3N5bmNfaHdwdHIoc25kX3BjbV90ICpwY20pCi0tCjIuMjUuMQoKUmVmZXJlbmNlcwoK
ICAgMS4gbWFpbHRvOmNvbnN1bHQuYXd5QGdtYWlsLmNvbQogICAyLiBtYWlsdG86YWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnCiAgIDMuIG1haWx0bzp0aXdhaUBzdXNlLmRlCiAgIDQuIG1haWx0
bzptYWhlbmRyYW4ua3VwcHVzYW15QGluLmJvc2NoLmNvbQogICA1LiBtYWlsdG86Y29uc3VsdC5h
d3lAZ21haWwuY29tCiAgIDYuIG1haWx0bzpjb25zdWx0LmF3eUBnbWFpbC5jb20K
