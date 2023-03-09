Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D01C6B1BCF
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 07:50:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D441D18A4;
	Thu,  9 Mar 2023 07:49:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D441D18A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678344617;
	bh=N8yU4MgkQUXD/16Yw5rwviWIDdztTKlT8jk7lcow0XE=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BnfNfNL6r7yLbTAXgpkZFaSbVn4OGAlb3pL6sZmMTe0G/jm513v9CyY00NJMdd2ex
	 ZdfPCBGzVtTpJjSknoY8xiaFgXbu+Wncn2FUzDTv9hndRuY8HgC4TwLg9ibQMSF3Ko
	 /JhANz2izAg/kj1pNOthiRi7vMXf/Kw2Oog/Uxcg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C41D5F8042F;
	Thu,  9 Mar 2023 07:49:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BC4AF8042F; Thu,  9 Mar 2023 07:15:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,
	HTML_IMAGE_ONLY_16,HTML_MESSAGE,RCVD_IN_DNSWL_HI,RDNS_DYNAMIC,
	SPF_HELO_NONE,SPF_PASS,T_REMOTE_IMAGE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com
 [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBC1EF8007E
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 07:14:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBC1EF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=UHCpqmwW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1678342489;
	bh=Ih8hxsnc002Wus2lqmpY9Y4+z1DCJiui0rFdj/YF7II=;
	h=Date:From:To:Subject;
	b=UHCpqmwWX1n+TXrgKCy8mLi1IjZ1qTZhC+Ib4JyGnkdqNcqCAV/d+HvR6TgnQ2nfE
	 +6FExM6XRfEZyRXi+mGJeaH7jjMtkh0C4I11x624gOZT2zg5z1MA3+0MtUa3CskCyR
	 O2LvdLM4bXQj1Q3JD+hg4ozA6JxJsHx0pJdoRuBU=
Received: from comp-station ([1.83.125.28])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id 366B587D; Thu, 09 Mar 2023 14:13:38 +0800
X-QQ-mid: xmsmtpt1678342418twmsosqlv
Message-ID: <tencent_EB8A99B504B39F1E7BF937EE98CDD2805206@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIeMziesZcbSxdBu6aq9F2P2coBgWIu73MKwXgIP3P+apDybTYJV3
	 9q9cXq6MtDY8hK6Y5NgH2wKZK50g43aTvG/PFSHz8o0uq6brm3YsrOlm6/CrGkyF6ChIdvl4US8w
	 TGPokcOVNiPaFG7tluwqXch31mg/hrs18+AjZ23vOL8tNK9LrWtYPmDEmH5AnAeF+rQN6Q9B2Yiv
	 LqE3VlmK+7inGrE+mtXKClhv//nbf09jBOOY5O8Twjxoy0ncdkb/tUdV3IJvQSVcl/gouni0LiGR
	 DBBn3hIbo4JA8CF0bbW9/YBMYjj8ImM6yxAUVv0gDjq1TJqXtzH7Tn0HTvYqHh8Kdeh2qgVmCZ2C
	 dGDb8juPX08Lq5Verpwqjss5NAxdIFKKcXZqALLrFnJpm8TXzxhHzRaH3DJGgMvsfXDrMKmQRxh2
	 8f/FK9QlkesraXBhNPEiMofkdnE63T2PWWsSd6wdfzOxISzreQj26yBBZOTgWucuwWbke1GdUBIi
	 9FWs+QkkD3mhnpvwzUqCBYTioJG6NAsuF3LlxPi0Tlh6PgLIv8Jy56D7s6Ft1lfQDZpDeciCBybr
	 VyKI3WvdA1rAr5YHGG0EPhC3GUxYjKBDYMFERcx7eqJ084M4LDaOSf5uk8wfP8WhXoQ4c9mO3pt3
	 DAztE+AQPZ5uoDq00z3uywf6n7e/KI/TJBicnWytf3pOEDnb3+6jCuLk+rZMOBNwbpw/23N2dS9J
	 YK3FXjbjn8XCIcQHjfLE8pZTWvmzAdX7NZY5hbddXAyRPuYW2kc844z6p2tPtghOmOTAqB+MdMIC
	 wnCUoW6olm5CfZaP4hQacjwGkj6DcyeVvnIdjBcZrJ5Qqp+1PWBCptbUcev/WFEIsjlCWTxJjN0x
	 x0RddmVadkX0bHi/C82Fz9Hq18O9mOd9s5lIG/wqd+XSx5F3Xa3PNTOo/JYugbIa5ap5zdzv6LOx
	 4PhrpZhsM=
Date: Thu, 9 Mar 2023 14:13:38 +0800
From: lainme <lainme@foxmail.com>
To: "=?utf-8?Q?alsa-devel=40alsa-project.org?="
 <alsa-devel@alsa-project.org>
X-OQ-MSGID: <97A26EC9-DF09-4DF6-8333-102251F91185@getmailspring.com>
Subject: Patch to make the built-in microphone of ThinkPad Neo 14
 (21EFA000CD) work
X-Mailer: Mailspring
MIME-Version: 1.0
X-MailFrom: lainme@foxmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: N5IEVHDVQB7UMRZLPOVCRFPGZPPLKWBW
X-Message-ID-Hash: N5IEVHDVQB7UMRZLPOVCRFPGZPPLKWBW
X-Mailman-Approved-At: Thu, 09 Mar 2023 06:49:22 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N5IEVHDVQB7UMRZLPOVCRFPGZPPLKWBW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGksDQoNClRoZSBidWlsdC1pbiBtaWNyb3Bob25lIG9mIFRoaW5rUGFkIE5lbyAxNCAoMjFFRkEw
MDBDRCkgZG9lc24ndCB3b3JrIHdpdGgga2VybmVsIDYuMi4yLCBhbmQgdGhlIGZvbGxvd2luZyBw
YXRjaCBjYW4gZml4IHRoaXMgaXNzdWUuIEhlcmUgdGhlIHJlbGV2YW50IGJ1ZyByZXBvcnQ6IGh0
dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE2OTI1DQotLS0gYS9z
b3VuZC9zb2MvYW1kL3ljL2FjcDZ4LW1hY2guYw0KKysrIGIvc291bmQvc29jL2FtZC95Yy9hY3A2
eC1tYWNoLmMNCkBAIC00OSw2ICs0OSwxMyBAQA0KLmRyaXZlcl9kYXRhID0gJmFjcDZ4X2NhcmQs
DQoubWF0Y2hlcyA9IHsNCkRNSV9NQVRDSChETUlfQk9BUkRfVkVORE9SLCAiTEVOT1ZPIiksDQor
IERNSV9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiMjFFRjAwMDJDRCIpLA0KKyB9DQorIH0sDQor
IHsNCisgLmRyaXZlcl9kYXRhID0gJmFjcDZ4X2NhcmQsDQorIC5tYXRjaGVzID0gew0KKyBETUlf
TUFUQ0goRE1JX0JPQVJEX1ZFTkRPUiwgIkxFTk9WTyIpLA0KRE1JX01BVENIKERNSV9QUk9EVUNU
X05BTUUsICIyMUQwIiksDQp9DQp9LA0K
