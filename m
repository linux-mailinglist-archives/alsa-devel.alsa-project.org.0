Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B864024711A
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 20:21:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48F0316EF;
	Mon, 17 Aug 2020 20:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48F0316EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597688461;
	bh=WX1Esf469xzfinPq//hGNIeHjQadns3TchtZymYu4iw=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hQIIYxi43e9eknqE2tIYcHBpNE/k+MPRM+wvy9jwn+DvqKE5QOIRlCYXaSewL0S3F
	 A8Z3Q+P31e6DT5ubmjq3BaRCIVKconcAYBx5I+9PcMBMzuZQcgYSU5Yj/a98HZ8UfZ
	 zYiBZa3/sZsH6+DdMU70CDSRGbP5mM8b+EzkNOPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5246FF800F0;
	Mon, 17 Aug 2020 20:19:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94FCEF80218; Mon, 17 Aug 2020 20:19:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_19,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.cccmz.de (mail.cccmz.de [IPv6:2a01:4f8:161:4283:1000::108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C509F800EF
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 20:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C509F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cccmz.de header.i=@cccmz.de
 header.b="Gonvk16Z"
Received: from tanjeffs-laptop (x4db55bd8.dyn.telefonica.de [77.181.91.216])
 (Authenticated sender: tanjeff@cccmz.de)
 by mail.cccmz.de (Postfix) with ESMTPA id 2E57717A0717;
 Mon, 17 Aug 2020 20:19:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cccmz.de; s=2019;
 t=1597688347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cxe1RdR4OfzPm5YjghqwnqnwKV1A6/EEvxv2A9LPujI=;
 b=Gonvk16ZVa6qUdvPPqYCkPXnAQ2+XXXvNhmHjTMFhXNPhdyNuq6MEuPcFA+Bo2eJ9Xv5L6
 cLuNAb8jF1BvswwuRr5G1U8+eAf59Qfr2yx/t6cMR1aVbxIcy/ufmyrGli1mQP1MW33zZm
 +yVpwTo9rNRLGxbE3Hj9IFBFoMKgV2Q=
Date: Mon, 17 Aug 2020 20:19:06 +0200
From: tanjeff <tanjeff@cccmz.de>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] Add documentation for snd_ctl_elem_list_*
Message-ID: <20200817201906.36ec9c4e@tanjeffs-laptop>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

=46rom 731895b67fcae743551989a5dd04382003e66560 Mon Sep 17 00:00:00 2001
From: "Tanjeff-N. Moos" <tanjeff@cccmz.de>
Date: Fri, 14 Aug 2020 08:40:28 +0200
Subject: [PATCH] Add documentation for snd_ctl_elem_list_*.

Signed-off-by: Tanjeff-N. Moos <tanjeff@cccmz.de>
---
 include/control.h     | 81 +++++++++++++++++++++++++++++++++++++++++--
 src/control/control.c | 80 ++++++++++++++++++++++++++++++++++++------
 2 files changed, 148 insertions(+), 13 deletions(-)

diff --git a/include/control.h b/include/control.h
index 02db72d4..9deec6f3 100644
--- a/include/control.h
+++ b/include/control.h
@@ -56,7 +56,75 @@ typedef struct _snd_ctl_card_info snd_ctl_card_info_t;
 /** CTL element identifier container */
 typedef struct _snd_ctl_elem_id snd_ctl_elem_id_t;
=20
-/** CTL element identifier list container */
+/** CTL element list container
+ *
+ * This is a list of CTL elements. The list contains management
+ * information (e.g. how many elements the sound card has) as well as
+ * the element identifiers. All functions which operate on the list
+ * are named snd_ctl_elem_list_*().
+ *
+ * \par Memory management
+ *
+ * There are two memory areas to deal with: The list container itself
+ * and the memory for the element identifiers.
+ *
+ * To manage the area for the list container, the following functions
+ * are used:
+ *
+ * - snd_ctl_elem_list_malloc() / snd_ctl_elem_list_free() to allocate
+ *   and free memory on the heap, or
+ * - snd_ctl_elem_list_alloca() to allocate the memory on the
+ *   stack. This memory is auto-released when the stack is unwound.
+ *
+ * To manage the space for the element identifiers, the
+ * snd_ctl_elem_list_alloc_space() and snd_ctl_elem_list_free_space()
+ * are used. Allocating the right amount of space can be achieved by
+ * first obtaining the number of elements and then calling
+ * snd_ctl_elem_list_alloc_space():
+ *
+ * \code
+ *   snd_ctl_elem_list_t* list;
+ *   int count;
+ *
+ *   // Initialise list
+ *   snd_ctl_elem_list_malloc(&list);
+ *
+ *   // Get number of elements
+ *   snd_ctl_elem_list(ctl, list);
+ *   count =3D snd_ctl_elem_list_get_count(list);
+ *
+ *   // Allocate space for identifiers
+ *   snd_ctl_elem_list_alloc_space(list, count);
+ *
+ *   // Get identifiers
+ *   snd_ctl_elem_list(ctl, list); // yes, this is same as above :)
+ *
+ *   // Do something useful with the list...
+ *
+ *   // Cleanup
+ *   snd_ctl_elem_list_free_space(list);
+ *   snd_ctl_elem_list_free(list);
+ * \endcode
+ *
+ *
+ * \par The Elements
+ *
+ * The elements in the list are accessed using an index. This index is
+ * the location in the list; Don't confuse it with the 'index' of the
+ * element identifier. For example:
+ *
+ * \code
+ *     snd_ctl_elem_list_t list;
+ *     unsigned int element_index;
+ *
+ *     // Allocate space, fill list ...
+ *
+ *     element_index =3D snd_ctl_elem_list_get_index(&list, 2);
+ * \endcode
+ *
+ * This will access the 3rd element in the list (index=3D2) and get the
+ * elements index from the driver (which might be 13, for example).
+ */
 typedef struct _snd_ctl_elem_list snd_ctl_elem_list_t;
=20
 /** CTL element info container */
@@ -354,11 +422,18 @@ void snd_ctl_event_copy(snd_ctl_event_t *dst, const s=
nd_ctl_event_t *src);
 snd_ctl_event_type_t snd_ctl_event_get_type(const snd_ctl_event_t *obj);
=20
 size_t snd_ctl_elem_list_sizeof(void);
+
 /** \hideinitializer
- * \brief allocate an invalid #snd_ctl_elem_list_t using standard alloca
- * \param ptr returned pointer
+ *
+ * \brief Allocate a #snd_ctl_elem_list_t using standard alloca.
+ *
+ * The memory is allocated on the stack and will automatically be
+ * released when the stack unwinds (i.e. no free() is needed).
+ *
+ * \param ptr Pointer to allocated memory.
  */
 #define snd_ctl_elem_list_alloca(ptr) __snd_alloca(ptr, snd_ctl_elem_list)
+
 int snd_ctl_elem_list_malloc(snd_ctl_elem_list_t **ptr);
 void snd_ctl_elem_list_free(snd_ctl_elem_list_t *obj);
 void snd_ctl_elem_list_clear(snd_ctl_elem_list_t *obj);
diff --git a/src/control/control.c b/src/control/control.c
index e21e8f1d..1bcf1ab2 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -280,6 +280,21 @@ int snd_ctl_card_info(snd_ctl_t *ctl, snd_ctl_card_inf=
o_t *info)
=20
 /**
  * \brief Get a list of element identifiers
+ *
+ * Before calling this function, memoru must be allocated using
+ * snd_ctl_elem_list_malloc().
+ *
+ * This function obtains data from the sound card driver and puts it
+ * into the list.
+ *
+ * If there was space allocated for the element identifiers (using
+ * snd_ctl_elem_list_alloc_space()), information will be filled in. If
+ * too little space was allocated, only a part of the elements will be
+ * queried. If there was too much space allocated, some of it remains
+ * unused. Use snd_ctl_elem_list_get_count() and
+ * snd_ctl_elem_list_get_used() to obtain information about space
+ * usage. See #snd_ctl_elem_list_t to learn more.
+ *
  * \param ctl CTL handle
  * \param list CTL element identifiers list pointer
  * \return 0 on success otherwise a negative error code
@@ -1508,9 +1523,14 @@ const char *snd_ctl_event_type_name(snd_ctl_event_ty=
pe_t type)
=20
 /**
  * \brief allocate space for CTL element identifiers list
- * \param obj CTL element identifiers list
- * \param entries Entries to allocate
- * \return 0 on success otherwise a negative error code
+ *
+ * The space can be released with snd_ctl_elem_list_free_space().
+ *
+ * \param obj CTL element identifiers list.
+ * \param entries How many entries to allocate. See
+ *        #snd_ctl_elem_list_t to learn how to obtain
+ *        this number in advance.
+ * \return 0 on success otherwise a negative error code.
  */
 int snd_ctl_elem_list_alloc_space(snd_ctl_elem_list_t *obj, unsigned int e=
ntries)
 {
@@ -1526,6 +1546,10 @@ int snd_ctl_elem_list_alloc_space(snd_ctl_elem_list_=
t *obj, unsigned int entries
=20
 /**
  * \brief free previously allocated space for CTL element identifiers list
+ *
+ * Releases space previously allocated using
+ * snd_ctl_elem_list_alloc_space().
+ *
  * \param obj CTL element identifiers list
  */
 void snd_ctl_elem_list_free_space(snd_ctl_elem_list_t *obj)
@@ -2016,7 +2040,7 @@ snd_ctl_event_type_t snd_ctl_event_get_type(const snd=
_ctl_event_t *obj)
 }
=20
 /**
- * \brief get size of #snd_ctl_elem_list_t
+ * \brief get size of #snd_ctl_elem_list_t.
  * \return size in bytes
  */
 size_t snd_ctl_elem_list_sizeof()
@@ -2025,7 +2049,10 @@ size_t snd_ctl_elem_list_sizeof()
 }
=20
 /**
- * \brief allocate an invalid #snd_ctl_elem_list_t using standard malloc
+ * \brief allocate a #snd_ctl_elem_list_t using standard malloc.
+ *
+ * The memory can be released using snd_ctl_elem_list_free().
+ *
  * \param ptr returned pointer
  * \return 0 on success otherwise negative error code
  */
@@ -2039,7 +2066,15 @@ int snd_ctl_elem_list_malloc(snd_ctl_elem_list_t **p=
tr)
 }
=20
 /**
- * \brief frees a previously allocated #snd_ctl_elem_list_t
+ * \brief frees a previously allocated #snd_ctl_elem_list_t.
+ *
+ * Release memory previously allocated using
+ * snd_ctl_elem_list_malloc().
+ *
+ * If you used snd_ctl_elem_list_alloc_space() on the list, you must
+ * use snd_ctl_elem_list_free_space() \em before calling this
+ * function.
+ *
  * \param obj pointer to object to free
  */
 void snd_ctl_elem_list_free(snd_ctl_elem_list_t *obj)
@@ -2048,7 +2083,15 @@ void snd_ctl_elem_list_free(snd_ctl_elem_list_t *obj)
 }
=20
 /**
- * \brief clear given #snd_ctl_elem_list_t object
+ * \brief Clear given #snd_ctl_elem_list_t object.
+ *
+ * This will make the stored identifiers inaccessible without freeing
+ * their space.
+ *
+ * \warning The element identifier space cannot be freed after calling
+ *          this function. Therefore, snd_ctl_elem_list_free_space()
+ *          must be called in advance.
+ *
  * \param obj pointer to object to clear
  */
 void snd_ctl_elem_list_clear(snd_ctl_elem_list_t *obj)
@@ -2057,7 +2100,11 @@ void snd_ctl_elem_list_clear(snd_ctl_elem_list_t *ob=
j)
 }
=20
 /**
- * \brief copy one #snd_ctl_elem_list_t to another
+ * \brief copy one #snd_ctl_elem_list_t to another.
+ *
+ * This performs a shallow copy. That means the both lists will share
+ * the same space for the elements.  The elements will not be copied.
+ *
  * \param dst pointer to destination
  * \param src pointer to source
  */
@@ -2080,6 +2127,12 @@ void snd_ctl_elem_list_set_offset(snd_ctl_elem_list_=
t *obj, unsigned int val)
=20
 /**
  * \brief Get number of used entries in CTL element identifiers list
+ *
+ * This function returns how many entries are actually filled with
+ * useful information.
+ *
+ * See also snd_ctl_elem_list_get_count().
+ *
  * \param obj CTL element identifier list
  * \return number of used entries
  */
@@ -2090,7 +2143,14 @@ unsigned int snd_ctl_elem_list_get_used(const snd_ct=
l_elem_list_t *obj)
 }
=20
 /**
- * \brief Get total count of elements present in CTL device (information p=
resent in every filled CTL element identifiers list)
+ * \brief Get total count of elements present in CTL device
+ *
+ * This function returns how many entries were allocated using
+ * snd_ctl_elem_list_alloc_space(). This information is present after
+ * snd_ctl_elem_list() was called.
+ *
+ * See also snd_ctl_elem_list_get_used().
+ *
  * \param obj CTL element identifier list
  * \return total number of elements
  */
@@ -2140,7 +2200,7 @@ snd_ctl_elem_iface_t snd_ctl_elem_list_get_interface(=
const snd_ctl_elem_list_t *
 }
=20
 /**
- * \brief Get device part of CTL element identifier for an entry of a CTL =
element identifiers list
+ * \brief Get the device part of CTL element identifier for an entry of a =
CTL element identifiers list
  * \param obj CTL element identifier list
  * \param idx Index of entry
  * \return CTL element related device
--=20
2.17.1

