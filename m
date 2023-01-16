Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D13CA66CBD0
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 18:18:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FF0358E7;
	Mon, 16 Jan 2023 18:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FF0358E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673889496;
	bh=E2BwdlSfSdNql01coFX3GOLetktx9JEoW/zwBkIW9mA=;
	h=Subject:From:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tIhyXBq3/Sz7TXs3pfLGhOuxK42VYlJB49LSIlhtHmAeDoZUNZiR8T3rIaI1VZ4FG
	 mQAePHvngaALnp5ilyp/6ueMsj1HcbyMDAUVtcDu469soMsXoen53sWOSS3mx/1feU
	 2OUanhKkyyHQ/Rb7e08822/wlXu6OSbyV4DnqZkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96D64F8023A;
	Mon, 16 Jan 2023 18:17:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FECDF80482; Mon, 16 Jan 2023 18:17:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3CF4F8023A
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 18:17:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3CF4F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PciueYCi
Received: by mail-vs1-xe34.google.com with SMTP id q125so17929461vsb.0
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 09:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:date:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=E2BwdlSfSdNql01coFX3GOLetktx9JEoW/zwBkIW9mA=;
 b=PciueYCiHL+8gKicoa+wx5jCtsA0nAiNUPICiBof5vAnup+KPOzNS8SE+FmQJ6e+en
 2ZK4/WjUPzzCSMudC5zlsLy2fbzBzV52YAHliwOugp8VE5arZgl1eghT3B/ZPj3bm8q3
 HL/l1+b6FdyiYd6W3jeqL7m+xnfC3bX8lPGtgxNEcT2YM3Rxt/q0ihC1V5+9xcc+6t8q
 ulOAjd82c1WqoN87AovClQk7T0UlkoSt2D9P8QWtiwIzgJZLbunytUBJb2qLl5Ri2QuL
 MSq5J4keRXh2L4tH7jIgfUXBxvB+ST6qNupogYMOmn/5W3brZU8izFD20ef1Y6l3RcdY
 sTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:date:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E2BwdlSfSdNql01coFX3GOLetktx9JEoW/zwBkIW9mA=;
 b=soUXoNNuluqyTBrAMZ+z0XXlDOBvM3xGZ6+q/WjsRxPbFjLhd0jaJUPZpm5LX5HeB2
 V519MlKjtN57cxwNepy2O9ALJF5Wj3O0Rrm2JhZy6fZ6QvxJr0JhaYQpgs0sUN6AiAYp
 Hp7E/0N8edLzqiBkluMitexMqt8ZTNv+qVMLKdI6aZI4uLoosqgHsscwdxaLa2Wdd9+P
 rQq8q0LAwZNpQG+oqVn4EPBgb/2hA3vYzJzfRC6jtz/lYTfQsK44O/Gduvjx3yw2nPDO
 sCnKo+u/T77XifgriAkoaHjDDYuAAZo8iL9R7etYKtNUj+0/0eJVM+gg5aApb5hEvfap
 8X0g==
X-Gm-Message-State: AFqh2koQogmeRmauI2lswR6a5h1aEUxEwbpF7ot0GKT9qqhLK5troSra
 JicFPjvKocLBZ34asbbaWkZjdMTafaryvA==
X-Google-Smtp-Source: AMrXdXtFoCbcTkHRA1tbRmLT3C5Y8BrYs4LGWivzoee7bCRz7NYnkqgLvNXL1fjpaX7joDrkgf7Smg==
X-Received: by 2002:a67:fc8e:0:b0:3d3:cb9c:f79b with SMTP id
 x14-20020a67fc8e000000b003d3cb9cf79bmr2147916vsp.2.1673889429037; 
 Mon, 16 Jan 2023 09:17:09 -0800 (PST)
Received: from ?IPv6:2601:14d:4e80:336e:6940:faac:fba5:1dee?
 ([2601:14d:4e80:336e:6940:faac:fba5:1dee])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a05620a258e00b006e07228ed53sm18442167qko.18.2023.01.16.09.17.08
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 09:17:08 -0800 (PST)
Message-ID: <66b11b3a9573fa450045056c971326db0a31893e.camel@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add OMEN by HP Gaming Laptop 16z-n000 into
 DMI table
From: Joseph Hunkeler <jhunkeler@gmail.com>
To: alsa-devel@alsa-project.org
Date: Mon, 16 Jan 2023 12:17:07 -0500
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.2 
MIME-Version: 1.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

QWRkaW5nIHN1cHBvcnQgZm9yIHRoZSBIUCBPbWVuIDE2ei1uMDAwIGxhcHRvcDsgdGhpcyBlbmFi
bGVzIHRoZSBpbnRlcm5hbAptaWNyb3Bob25lLgoKU2lnbmVkLW9mZi1ieTogSm9zZXBoIEh1bmtl
bGVyIDxqaHVua2VsZXJAZ21haWwuY29tPgotLS0KwqBzb3VuZC9zb2MvYW1kL3ljL2FjcDZ4LW1h
Y2guYyB8IDcgKysrKysrKwrCoDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9zb3VuZC9zb2MvYW1kL3ljL2FjcDZ4LW1hY2guYyBiL3NvdW5kL3NvYy9hbWQveWMv
YWNwNngtbWFjaC5jCmluZGV4IDFmMGI1NTI3YzU5NC4uMzJiNjExODlkNjUzIDEwMDY0NAotLS0g
YS9zb3VuZC9zb2MvYW1kL3ljL2FjcDZ4LW1hY2guYworKysgYi9zb3VuZC9zb2MvYW1kL3ljL2Fj
cDZ4LW1hY2guYwpAQCAtMjIwLDYgKzIyMCwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9z
eXN0ZW1faWQgeWNfYWNwX3F1aXJrX3RhYmxlW10gPSB7CsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoERNSV9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiUmVk
bWkgQm9vayBQcm8gMTQgMjAyMiIpLArCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0K
wqDCoMKgwqDCoMKgwqDCoH0sCivCoMKgwqDCoMKgwqDCoHsKK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoC5kcml2ZXJfZGF0YSA9ICZhY3A2eF9jYXJkLAorwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgLm1hdGNoZXMgPSB7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgRE1JX01BVENIKERNSV9CT0FSRF9WRU5ET1IsICJIUCIpLAorwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoERNSV9NQVRDSChETUlfUFJP
RFVDVF9OQU1FLCAiT01FTiBieSBIUCBHYW1pbmcgTGFwdG9wIDE2ei1uMDAwIiksCivCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9CivCoMKgwqDCoMKgwqDCoH0sCsKgwqDCoMKgwqDCoMKg
wqB7fQrCoH07CsKgCgo=

