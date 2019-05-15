Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 732F51E875
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 08:46:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1EDD1658;
	Wed, 15 May 2019 08:45:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1EDD1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557902809;
	bh=Gbgwn2/1XQ7+7DEEZ9Oty3Tet3dE22ZcE1ihnW6LgFM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bMxmWRMBJC58hZd+wKELgb4Xv6UK2995vQEmfpqWZKjMJKiHlqr3/JCexl6qhcxop
	 /ylyKKXFRs6OQQZudvB7ldFHyxiCoXnZrI68GOJyGMgw2MCw2xJsXRE1LOTz8jGsHr
	 yV+chp286nnIYtgmeVlF8qyGgyNw2/T6rk+25/0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6C14F89684;
	Wed, 15 May 2019 08:45:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C28C8F89707; Wed, 15 May 2019 08:44:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU autolearn=disabled version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B694F80C17;
 Wed, 15 May 2019 08:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B694F80C17
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="Tag7rB06"
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
 by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 453lR81kYsz1XLFrr;
 Wed, 15 May 2019 08:44:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=2015-01-21; t=1557902692;
 bh=+TVp52IkGNJnh2B4z2dwEBH9KjuGFtbPxfxihbonQ6c=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=Tag7rB06KnlIqaur/Pnpio1lJosXpLK/cokwocqF7Hb4JMvMFuuqllCqnbbRmi+Ul
 NaMU7qOTP6drwWU6VvPxcHXVaD335nHZZdE+uGWCWZb94G6ZrYMPEzJrNQ6eWsR9yZ
 Oq/LlQdyRSxNl8W2bVcMxinBFRYjYDejiujUAL6o=
Received: from fe0vm02900.rbesz01.com (unknown [10.58.172.176])
 by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 453lR81PNlz1Tr;
 Wed, 15 May 2019 08:44:52 +0200 (CEST)
X-AuditID: 0a3aad0c-d19ff700000039d6-e6-5cdbb563d940
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm02900.rbesz01.com (SMG Outbound) with SMTP id 12.F3.14806.365BBDC5;
 Wed, 15 May 2019 08:44:51 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (fe-hub2000.de.bosch.com [10.4.103.109])
 by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 453lR75NW4z5fG;
 Wed, 15 May 2019 08:44:51 +0200 (CEST)
Received: from localhost.localdomain (10.47.103.61) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5;
 Wed, 15 May 2019 08:44:50 +0200
From: <vanitha.channaiah@in.bosch.com>
To: <tiwai@suse.de>, <patch@alsa-project.org>
Date: Wed, 15 May 2019 11:56:31 +0530
Message-ID: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.47.103.61]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLsWRmVeSWpSXmKPExsXCZbVWVjd56+0Yg7YDVhZXLh5isli7vIHV
 4uXmN0wWi6bNZHJg8djwuYnNY1b7anaPzaerA5ijuGxSUnMyy1KL9O0SuDImvXzDVrBIpOLo
 M/4GxtMCXYycHBICJhLbTvUydTFycQgJzGSS2HPxF5Szh1Hi49mZzBDOGkaJ+7sPMIO0sAmo
 SRy59oEdxBYR0JV4+ngSWxcjBwezgI3E3P5skLCwgITE3nMPwUpYBFQlzuw8AdbKK+AncXzB
 cVaIzXISN891QsUFJU7OfMICYjMD9R588YIZokZBYsq1GawTGPlmISmbhaRsASPTKkaxtFSD
 slwDI0sDA72ipNTiKgNDveT83E2MkGDj2cF4dEn6IUYBDkYlHt6yRbdjhFgTy4orcw8xmnIw
 KYnytqQBhfiS8lMqMxKLM+KLSnNSi5WkeGUueMUICcOFi0uTcjOLizPz8w4xSnAwK4nwRine
 iBHiTUmsrEotyodoO8QozcGiJM6bzuEfIySQnliSmp2aWpBaBJO15uBQkuCN3wK0ULAoNT21
 Ii0zpwQmrSTLy8jAwCAkhiyDbC0TB+chRmMOHqDdt0BG8BYXJOYWZ6ZDtUtCtAvBRBFaTzGa
 S4nz2oD0CIBkM0rz4LZKyfBee3s9RkgUSQKh8xXjTUZguAnzGoM08wBTJMI+CV5pUBAJQgUR
 moyWAvUIvOeW2HxgPpvEne+/2CSa5jdySLy4d55TYsn8fi6JFR9fckt8ePSVV2LD9tl8Emf+
 LOOTaOm+ySdxYsJcfok79zuFJc5smScscXhCt4jEvfOLRSUu7dovKjHv2xlxiY49z6Qldu+Y
 ISvx6v9RWYmNP47IScxf9F9eYv/U74oSN6ctUZK49GuxssTnyXfUJNas6dCQuHfuv4bEq/1T
 NSXuTWnVk9jS2qkv8aNls/ErYGAyAQPTMvMWKDBLEkuwBCZUFOE7qQbGhb5mLJ9mzs42+bPe
 ynOS9ZpPbjs032omhtp8lzTQEb4saJk+dfW/g7KLPDonTcte2sx2ZZ05e/3KWWa9G9h3TAuw
 OCZjLLCnYeOUOTlf1783ZZJtuqK+mW/zc+eXscIHX5etPj7/er+/ztl74i0Bz0Rawk59jdC5
 y1B07u/fK/G5RjLmcop7lFiKMxINtZiLihMBkiM8AisEAAA=
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH v2 0/6]
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

- Updated the patches by incorporating review comments from Takashi Iwai-san

[PATCH 1/5] pcm: direct: Add generic hw_ptr_alignment function for dmix, dshare and dsnoop
[Takashi Iwai:]
> The patch description needs rephrasing.  What actually this does is to move the code from pcm_dmix.c to pcm_direct.c
> and its header so that the helper code can be re-used by other direct-PCM plugins.

- Commit message is rephrased as suggested.
- New commit: [PATCH v2 1/6] pcm: direct: Add generic hw_ptr_alignment function for


[PATCH 2/5] pcm: dshare: Added "hw_ptr_alignment"	option in configuration for alignment of slave pointers
[Takashi Iwai:]
> Again, this patch description is too ambiguous.
> And, if it enables the hw_ptr_alignment option, update the documentation as well.

- Commit message is explained in detail for the changes done.
- Documentation updated.
- New commit: [PATCH v2 2/6] pcm: dshare: Added "hw_ptr_alignment" option in


[PATCH 3/5] pcm: dsnoop: Added "hw_ptr_alignment"	option in configuration for slave pointer alignment
[Takashi Iwai:]
> Ditto as patch 2, the description is too ambiguous, and the update of documentation is missing.
> It's not good to change the helper function semantics out of sudden, even without any description.

- Commit message is explained in detail for the changes done.
- Documentation updated.
- Divided the patch with commit ("pcm: dsnoop: Add hw_ptr_alignment option in configuration")
  into additional patch commit ("pcm: direct: Round up of slave_app_ptr pointer if buffer")
- Usecase scenario is described for the changes done in helper function.
- New commit:
    [PATCH v2 3/6] pcm: dsnoop: Added "hw_ptr_alignment" option in
    [PATCH v2 4/6] pcm: direct: Round up of slave_app_ptr pointer if buffer


[PATCH 4/5] pcm: restructuring sw params function
[Takashi Iwai:]
> I see no reason to do that.  Please describe.

- Commit message is explained in detail why reformating was done.
- New commit: [PATCH v2 5/6] pcm: restructuring sw params function


[PATCH 5/5] pcm: Update pcm->avail_min with	needed_slave_avail_min, after reading unaligned frames
[Takashi Iwai:]
> This kind of changes in the core code should be avoided as much as possible, especially if it's only relevant with the specific plugins.
> Sorry, this isn't convincing enough.  If this is a MUST, please clarify better.

- Commit message is explained in detail with the generic usecase and specific use case we came across.
- New commit: [PATCH v2 6/6] pcm: Update pcm->avail_min with needed_slave_avail_min,

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
